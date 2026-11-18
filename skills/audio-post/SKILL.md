---
name: audio-post
description: Video uchun professional ovoz qatlami — o'zbekcha voice-over, fon musiqasi, SFX ovoz dizayni, miks va -14 LUFS mastering (ffmpeg). "Ovoz qil", "musiqa qo'sh", "SFX", "LUFS", "ovozni tozala" so'ralganda ishlat.
---

# Audio Post-Production

## Natija

`final.wav` — 48 kHz, 24-bit, **−14 LUFS integrated, ≤ −1 dBTP**, ovoz aniq, musiqa ovoz ostida avtomatik pasayadi.

## 1. Voice-over

1. Skriptni ovozga moslash → `prompts/voiceover.md` (raqamlar so'z bilan, qisqa gaplar, pauzalar).
2. Ovoz brifi va sozlamalar → o'sha fayl, 2–3-bo'lim.
3. Har gapni alohida generatsiya qil — keyin eng yaxshisini tanlash oson.

## 2. Musiqa

`prompts/music-sfx.md` 1-bo'lim. Doim **instrumental**, video uzunligidan 2–3 s uzunroq, aniq yakun (final hit).

## 3. SFX — "cue sheet"

Shotlist bo'yicha har bir hodisaga tovush yoz:

| Vaqt | Hodisa | SFX | Daraja |
|---|---|---|---|
| 0.00 | hook kadri | impact | −6 dB |
| 2.00 | o'tish | whoosh | −10 dB |
| 5.10 | mahsulot | shimmer | −12 dB |
| 12.00 | CTA oldi | riser → hit | −8 dB |

SFX'larni bitta trekka joylashtirish (ffmpeg):
```bash
ffmpeg -i impact.wav -i whoosh.wav -i shimmer.wav -filter_complex \
"[0]adelay=0|0[a];[1]adelay=2000|2000,volume=0.3[b];[2]adelay=5100|5100,volume=0.25[c];[a][b][c]amix=inputs=3:normalize=0" sfx.wav
```

## 4. Miks + master

```bash
bash scripts/master-audio.sh -v voice.wav -m music.mp3 -s sfx.wav -o final.wav
```

Skript nima qiladi:
1. **Ovoz zanjiri:** highpass 80 Hz → lowpass 14 kHz → kompressor 3:1 → de-esser.
2. **Ducking:** ovoz gapirganda musiqa sidechain kompressor bilan pasayadi.
3. **Limiter** — cho'qqilarni ushlaydi.
4. **Ikki bosqichli loudnorm** → −14 LUFS / −1 dBTP / LRA 11 (bir bosqichlidan aniqroq).
5. **Tekshiruv** — yakuniy LUFS va true peak'ni chiqaradi.

Parametrlar: `-t -16` (podkast), `-d 0.12` (musiqani yanada pastroq qilish).

## 5. Tekshiruv

```bash
ffmpeg -i final.wav -af ebur128=peak=true -f null - 2>&1 | tail -12
```
- [ ] Integrated: −14 ±1 LUFS
- [ ] True peak ≤ −1.0 dBTP
- [ ] Telefon dinamigida ovoz aniq eshitiladi (musiqa bosib ketmaydi)
- [ ] Boshida/oxirida "klik" yo'q
