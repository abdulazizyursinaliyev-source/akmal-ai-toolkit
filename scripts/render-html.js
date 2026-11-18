#!/usr/bin/env node
/**
 * render-html.js — GSAP/CSS animatsiyali HTML sahifani kadrma-kadr MP4 videoga aylantiradi.
 *
 * Ishlatish:
 *   npm i playwright && npx playwright install chromium
 *   node scripts/render-html.js templates/motion-subtitles.html out.mp4 [--fps 30] [--w 1080] [--h 1920] [--transparent]
 *
 * Talab: sahifa window.__seek(t), window.__duration va window.__ready ni e'lon qilgan bo'lishi kerak
 * (templates/ dagi barcha shablonlar shunday). Sahifa ?render=1 bilan ochiladi.
 * --transparent → fonsiz ProRes 4444 .mov (videoga overlay qilish uchun).
 *
 * Har bir kadr aniq vaqtga seek qilinadi — shuning uchun natija kompyuter tezligiga bog'liq emas,
 * kadrlar tushib qolmaydi.
 */
const { chromium } = require('playwright');
const { spawn } = require('child_process');
const path = require('path');

const args = process.argv.slice(2);
const opt = (k, d) => { const i = args.indexOf(k); return i > -1 ? args[i + 1] : d; };
const [input, output] = args;
if (!input || !output) { console.error('Ishlatish: node render-html.js <page.html> <out.mp4>'); process.exit(1); }

const FPS = +opt('--fps', 30), W = +opt('--w', 1080), H = +opt('--h', 1920);
const transparent = args.includes('--transparent');
const extra = opt('--query', '');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: W, height: H }, deviceScaleFactor: 1 });
  // Oflayn rejim: `npm i gsap` qilingan bo'lsa, CDN o'rniga lokal fayl ishlatiladi
  try {
    const local = require.resolve('gsap/dist/gsap.min.js');
    await page.route('**/gsap.min.js', r => r.fulfill({ path: local, contentType: 'text/javascript' }));
  } catch (_) { /* lokal gsap yo'q — CDN ishlatiladi */ }

  const url = (input.startsWith('http') ? input : 'file://' + path.resolve(input)) + '?render=1' + (extra ? '&' + extra : '');
  await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 60000 });
  await page.waitForFunction(() => window.__ready === true, null, { timeout: 30000 });
  if (transparent) await page.addStyleTag({ content: 'html,body,.stage{background:transparent!important}' });

  const duration = await page.evaluate(() => window.__duration);
  const frames = Math.ceil(duration * FPS);
  const stage = await page.$('#stage') || page;

  const ff = spawn('ffmpeg', [
    '-y', '-loglevel', 'error', '-f', 'image2pipe', '-framerate', String(FPS), '-i', '-',
    ...(transparent
      ? ['-c:v', 'prores_ks', '-profile:v', '4444', '-pix_fmt', 'yuva444p10le']
      : ['-c:v', 'libx264', '-preset', 'slow', '-crf', '17', '-pix_fmt', 'yuv420p', '-movflags', '+faststart']),
    output,
  ], { stdio: ['pipe', 'inherit', 'inherit'] });

  for (let f = 0; f < frames; f++) {
    await page.evaluate(t => { window.__seek(t); }, f / FPS);
    const buf = await stage.screenshot({ type: 'png', omitBackground: transparent });
    if (!ff.stdin.write(buf)) await new Promise(r => ff.stdin.once('drain', r));
    if (f % FPS === 0) process.stdout.write(`\r🎬 ${f}/${frames} kadr`);
  }
  ff.stdin.end();
  await new Promise(r => ff.on('close', r));
  await browser.close();
  console.log(`\r✅ ${output} — ${frames} kadr, ${duration.toFixed(2)}s, ${W}x${H}@${FPS}`);
})().catch(e => { console.error(e); process.exit(1); });
