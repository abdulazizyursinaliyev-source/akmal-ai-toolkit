# 🎵 Musiqa va SFX (ovoz effektlari)

## 1. Musiqa — Suno / Udio prompt

**Formula:** `[Janr] + [Kayfiyat] + [Tempo BPM] + [Asboblar] + [Tuzilma] + [Vokal]`

```text
Upbeat playful acoustic pop, warm and joyful, 112 BPM, ukulele, hand claps, glockenspiel, soft kick,
instrumental, no vocals, clean mix leaving space for voice-over, 30 seconds, ends on a clear final hit.
```

**Tuzilma teglari (Suno lyrics maydonida):**
```text
[Intro: 2 bars, light]
[Build]
[Drop: full energy]
[Outro: clean ending, final hit]
```

| Kontent | Janr | BPM |
|---|---|---|
| Bolalar mahsuloti | playful acoustic, ukulele, glockenspiel | 100–120 |
| Oziq-ovqat / ASMR | lo-fi chill, soft beat | 80–95 |
| Texnologiya / AI | minimal electronic, pulsing synth | 118–128 |
| Premium / hikoya | cinematic piano, strings, ambient | 70–90 |
| Trend / energiya | phonk / drill beat (instrumental) | 130–150 |
| O'zbek ruhi | modern Uzbek pop, doira percussion, dutar texture | 100–120 |

**Qoidalar:**
- Reklama ostida doim **instrumental** (vokal VO bilan to'qnashadi).
- Musiqa VO dan **18–20 dB past** — `master-audio.sh` avtomatik pasaytiradi (ducking).
- Tijoriy foydalanish huquqini platforma shartlaridan tekshiring.

## 2. SFX — ovoz dizayni

Har 2–3 soniyadagi vizual o'zgarishga **bitta** tovush.

| Vizual hodisa | SFX | Davomiylik |
|---|---|---|
| Hook / birinchi kadr | impact, bass hit | 0.3–0.8s |
| Sahna o'tishi | whoosh, swipe | 0.2–0.5s |
| Matn paydo bo'lishi | pop, click, tick | 0.05–0.15s |
| Mahsulot ko'rinishi | shimmer, sparkle | 0.5–1s |
| CTA oldidan | riser (ko'tariluvchi) → hit | 1–2s |
| Oziq-ovqat | crunch, pour, sizzle (ASMR) | real |
| Kulgili moment | boing, record scratch | 0.3–0.6s |

**SFX generatsiya prompti (ElevenLabs Sound Effects va h.k.):**
```text
Short punchy cinematic whoosh transition, left to right, clean, no reverb tail, 0.4 seconds
```
```text
Crispy apple chips crunch, close-up ASMR, single bite, dry studio recording
```

## 3. Ovoz balansi (miks)

| Trek | Daraja (VO ga nisbatan) |
|---|---|
| Voice-over | 0 dB (asosiy) |
| Musiqa (VO paytida) | −18…−20 dB |
| Musiqa (VO yo'q joyda) | −8…−10 dB |
| SFX | −6…−12 dB |
| **Master** | **−14 LUFS integrated, −1 dBTP** |

```bash
bash scripts/master-audio.sh -v voice.wav -m music.mp3 -s sfx.wav -o final.wav
# ✅ Tayyor: -14.00 LUFS, true peak -1.xx dBTP
```

> **Nega −14 LUFS?** Instagram, TikTok, YouTube ovozni taxminan shu darajaga keltiradi. Balandroq qilsangiz — platforma pasaytiradi va dinamika yo'qoladi; pastroq — video "sokin" eshitiladi.
