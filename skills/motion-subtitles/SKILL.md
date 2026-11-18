---
name: motion-subtitles
description: Videoga so'zma-so'z animatsion subtitr (motion captions) qo'shadi — transkripsiya, so'z vaqtlari, GSAP shabloni yoki .ass fayl, render va videoga kuydirish. "Subtitr qo'sh", "animatsion matn", "captions" so'ralganda ishlat.
---

# Motion Subtitles

## Natija variantlari

| Variant | Qachon | Vosita |
|---|---|---|
| **A. GSAP overlay** (eng chiroyli) | Premium animatsiya kerak | `templates/motion-subtitles.html` → `scripts/render-html.js --transparent` → ffmpeg overlay |
| **B. .ass karaoke** (eng tez) | Ko'p video, tez natija | `scripts/srt-to-ass.py` → `scripts/assemble-video.sh -s` |
| C. Montaj dasturi | CapCut/Premiere'da ishlaydi | `.srt` eksport |

## 1-qadam: So'z vaqtlari (word timestamps)

Subtitr **eshitilgan so'zma-so'z** bo'lishi shart. Variantlar:

```bash
# Whisper (lokal, bepul) — so'z darajasidagi vaqtlar
pip install openai-whisper
whisper voice.wav --language uz --word_timestamps True --output_format json
```
Yoki ElevenLabs Scribe / boshqa STT — so'z vaqtlarini JSON da beradi.

**Majburiy tekshiruv:** AI transkripsiyani qo'lda o'qib chiq — o'zbekcha nomlar, brendlar, oʻ/gʻ harflari ko'pincha xato chiqadi. Tarjima yoki parafraz qilinmaydi.

## 2-qadam: JSON → CONFIG

Whisper JSON'dan GSAP shabloniga:

```python
import json
data = json.load(open("voice.json"))
words = [[w["word"].strip(), round(w["start"], 2), round(w["end"], 2), ""]
         for seg in data["segments"] for w in seg["words"]]
print(json.dumps(words, ensure_ascii=False))
```
Natijani `templates/motion-subtitles.html` dagi `CONFIG.words` ga qo'y. Kalit so'zlarga `"emph"` belgisi.

## 3-qadam: Render

```bash
# Shaffof overlay (ProRes 4444)
node scripts/render-html.js templates/motion-subtitles.html subs.mov --transparent --query "style=pop"

# Videoga ustma-ust qo'yish
ffmpeg -i reel.mp4 -i subs.mov -filter_complex "[0:v][1:v]overlay=0:0" -c:a copy final.mp4
```

Uslublar: `pop` · `rise` · `fade` · `typewriter`.  Fon: `?ground=sand|sky|sage|painting`.

## Subtitrga xos qoidalar

Umumiy dizayn qoidalari — [`skills/brand-design`](../brand-design/SKILL.md). Bu yerda faqat subtitrga xoslari:

| Qoida | Qiymat |
|---|---|
| Shrift | Inter 500 (urg'u 700) |
| O'lcham | 8cqw (~86px @1080), urg'u 10cqw |
| Satrda | 2–3 so'z, nafas joyida yangi satr |
| Ajratish | faol so'z to'liq `#f4f4f4`, qolgani 42% shaffof — **rang marker yo'q** |
| Joy | pastdan 24%, yon 7% (Reels/TikTok UI xavfsiz zonasi) |
| O'qilish | pastki qismda yumshoq qora gradient |

## Tekshiruv

- [ ] Har so'z ovoz bilan ±50 ms sinxron
- [ ] Bir ekranda ≤ 3 so'z
- [ ] Imlo: oʻ, gʻ, sh, ch to'g'ri
- [ ] UI tugmalari (like, izoh) ostida qolmaydi
