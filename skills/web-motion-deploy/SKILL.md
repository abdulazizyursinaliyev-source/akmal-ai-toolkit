---
name: web-motion-deploy
description: GSAP va CSS bilan jonli, tabiiy animatsiyali sahifalar (landing, promo, kinetik matn) yaratish, ularni HTML dan MP4 ga render qilish va GitHub Pages / Vercel / Netlify'ga deploy qilish. "Animatsiya", "GSAP", "landing", "sayt", "deploy" so'ralganda ishlat.
---

# Web Motion + Deploy

## Animatsiya tamoyillari (jonli va tabiiy ko'rinishi uchun)

| Tamoyil | Amalda |
|---|---|
| **Easing** | Hech qachon `linear` (progress bar bundan mustasno). Kirish: `power3.out` / `expo.out`. Chiqish: `power2.in`. "Sakrash": `back.out(1.8)` |
| **Davomiylik** | Kichik element 0.2–0.35s · matn 0.4–0.6s · sahna 0.7–1.0s |
| **Stagger** | Elementlar birin-ketin: 40–80 ms farq |
| **Overlap** | Keyingi animatsiya oldingisi tugamasdan boshlanadi (`"-=0.2"`) |
| **Bitta fokus** | Bir vaqtda bitta asosiy harakat |
| **Transform + opacity** | Faqat shular (GPU) — `top/left/width` animatsiya qilinmaydi |
| **Reduced motion** | `prefers-reduced-motion` da animatsiya o'chadi |

## GSAP asosiy naqshlar

```js
// Matn niqobdan chiqishi
gsap.from('.title .w > span', { yPercent: 110, duration: .55, stagger: .06, ease: 'power4.out' });

// Timeline — sahnalar ketma-ketligi
const tl = gsap.timeline({ defaults: { ease: 'power3.out' } });
tl.from('.hero', { opacity: 0, y: 40, duration: .7 })
  .from('.cta', { scale: .9, opacity: 0, duration: .4 }, '-=0.3');

// Scroll bilan (ScrollTrigger plagini)
gsap.from('.card', { y: 60, opacity: 0, stagger: .1,
  scrollTrigger: { trigger: '.cards', start: 'top 80%' } });
```

CSS-only variant: `templates/css-animations.css` — `.anim-rise`, `.anim-pop`, `.anim-stagger`, `.anim-on-scroll`.

## HTML → video

Har bir shablon `window.__seek(t)`, `__duration`, `__ready` ni e'lon qiladi — shunda kadrma-kadr aniq render:

```bash
npm i playwright gsap && npx playwright install chromium
node scripts/render-html.js templates/ad-scenes.html ad.mp4 --fps 30
node scripts/render-html.js templates/logo-reveal.html logo.mov --transparent
```

O'z sahifangizni render qilish uchun timeline'ni `paused` yarating va:
```js
window.__duration = tl.duration();
window.__seek = t => { tl.seek(t, false); };   // {} — muhim: obyekt qaytarmasin
window.__ready = true;
```

## Deploy

### GitHub Pages (bepul, eng oson)
1. Repo → **Settings → Pages** → Source: `Deploy from a branch` → `main` / `/ (root)` → Save.
2. 1–2 daqiqadan keyin: `https://<username>.github.io/<repo>/`.
3. Ildizdagi `index.html` — bosh sahifa.

### Vercel / Netlify
- GitHub repo'ni ulang → framework: "Other" → build buyrug'i bo'sh → deploy.
- Har `git push` da avtomatik yangilanadi.

## Deploy oldidan tekshiruv

- [ ] Barcha CDN versiyalari aniq (`gsap/3.12.5`, `@latest` emas)
- [ ] Rasmlar siqilgan (WebP, ≤ 300 KB)
- [ ] Telefonda (390px) gorizontal scroll yo'q
- [ ] `<title>` va `<meta name="description">` bor
- [ ] Havolalar nisbiy (`templates/x.html`, `/x.html` emas — Pages pastki papkada ishlaydi)
