# 🎙 Ovoz (voice-over) — o'zbekcha, tabiiy

## 1. Skriptni ovoz uchun tayyorlash

AI ovoz modeli matnni **qanday yozilgan bo'lsa shunday** o'qiydi. Shuning uchun:

| Qoida | Noto'g'ri | To'g'ri |
|---|---|---|
| Raqamlarni so'z bilan | 30 soniya | o'ttiz soniya |
| Qisqartmalarni ochish | va h.k. | va hokazo |
| Qisqa gaplar (≤ 12 so'z) | uzun murakkab gap | ikki qisqa gap |
| Pauza — nuqta yoki "…" | vergul bilan ulangan | Nuqta. Keyin yangi gap. |
| Urg'u so'z — alohida gap | | Bepul. Ha, bepul. |
| Inglizcha brend — talaffuz bo'yicha | AI | ey-ay (kerak bo'lsa) |

## 2. Ovoz tanlash brifi

```text
Voice: [erkak/ayol], [yosh: 25-35], warm and friendly, natural Uzbek pronunciation,
conversational not announcer-like, medium pace, smiling tone, slight energy on the hook.
```

| Kontent | Ovoz |
|---|---|
| Bolalar mahsuloti (Peppy) | Iliq ayol ovozi, yumshoq, tabassum bilan |
| Oziq-ovqat (Frutata) | Energik, ishtahali, o'rta temp |
| Ta'limiy (AI darslar) | Ishonchli, aniq, do'stona |
| Premium | Sekin, chuqur, pauzalar ko'p |

## 3. ElevenLabs sozlamalari (tavsiya)

| Parametr | Reklama | Hikoya/multfilm |
|---|---|---|
| Stability | 0.35–0.45 | 0.25–0.35 (ko'proq emotsiya) |
| Similarity | 0.75 | 0.75 |
| Style | 0.2–0.4 | 0.4–0.6 |
| Speed | 1.0–1.08 | 0.95–1.0 |

Ekspressiv modellar (masalan Eleven v3) audio teglarni qo'llaydi: `[excited]`, `[whispers]`, `[laughs]`, `[pause]`. Qo'llab-quvvatlanishini model hujjatidan tekshiring.

```text
[excited] Farzandingiz zerikdimi? [pause] Unda buni ko'ring.
```

## 4. Yozib olish (o'z ovozingiz bilan)

- Xona: yumshoq buyumlar ko'p joy (shkaf ichi — eng yaxshi "studiya").
- Mikrofon og'izdan 15–20 sm, biroz yon tomonda (p/b portlashlarini kamaytiradi).
- WAV, 48 kHz, 24-bit. Har bir gapni 2–3 marta yozing.
- Boshida 3 soniya jimlik — shovqin namunasi (tozalash uchun).

## 5. Keyingi qadam

Ovoz → [`scripts/master-audio.sh`](../scripts/master-audio.sh) (tozalash + musiqa + SFX + **-14 LUFS**).
So'z vaqtlari → [`skills/motion-subtitles`](../skills/motion-subtitles/SKILL.md).
