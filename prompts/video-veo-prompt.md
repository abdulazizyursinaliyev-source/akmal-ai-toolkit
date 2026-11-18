# 🎬 Video Prompt - Google Veo 3.1 / Gemini

Reklama va Reels uchun video prompt yozish tizimi. Nusxa oling → `[...]` ni to'ldiring → modelga bering.

---

## 1. Formula (5 qism)

```
[Kamera] + [Qahramon] + [Harakat] + [Joy] + [Uslub va yorug'lik] + [Ovoz]
```

| Qism | Nima yoziladi | Misol |
|---|---|---|
| Kamera | Kadr turi va harakati | `close-up`, `slow dolly-in`, `tracking shot`, `top-down`, `POV` |
| Qahramon | Asosiy obyekt - aniq tavsif | `a red Frutata apple chips bag` |
| Harakat | Bitta asosiy harakat | `a hand tears the bag open` |
| Joy | Fon, muhit | `rustic wooden kitchen table` |
| Uslub | Yorug'lik, rang, kayfiyat | `warm golden-hour light, shallow depth of field` |
| Ovoz | SFX, musiqa, nutq | `SFX: crisp crunch. Music: upbeat light acoustic.` |

**Oltin qoida:** bitta klip = bitta harakat. 2-3 harakatni bitta klipga tiqish - eng ko'p uchraydigan xato.

## 2. Texnik parametrlar

| Parametr | Qiymat |
|---|---|
| Klip uzunligi | 4, 6 yoki 8 soniya |
| Reels / Stories / TikTok | **9:16** (vertikal) |
| YouTube / sayt | 16:9 |
| 15-24s reklama | 2-3 ta 8s klip ketma-ket |
| Bir xil mahsulot/yuz | `reference image` yuklang (har bir klipda o'sha surat) |

## 3. Umumiy shablon

```text
[KADR TURI] of [MAHSULOT - rang, qadoq, brend] on [JOY].
[BITTA HARAKAT].
Background: [FON], softly blurred.
Lighting: [YORUG'LIK].
Style: premium commercial advertising, shallow depth of field, [RANG GRADING].
Audio: SFX: [OVOZ EFFEKTI]. Music: [MUSIQA USLUBI]. No dialogue.
Vertical 9:16.
```

**Negative prompt (doim qo'shing):**
```text
no text, no subtitles, no watermark, no logo distortion, no extra hands, no deformed packaging, no blurry product
```

## 4. Tayyor misollar

### Frutata chips - 8s

```text
Close-up slow dolly-in of a Frutata apple chips bag standing on a rustic wooden table.
A hand tears the bag open and golden apple chips spill out in slow motion.
Background: warm home kitchen, softly blurred.
Lighting: soft natural window light from the left, golden-hour warmth.
Style: premium food commercial, shallow depth of field, warm golden grading, crunchy appetizing mood.
Audio: SFX: bag rustle, crisp crunch. Music: light upbeat acoustic. No dialogue.
Vertical 9:16.
```

### Peppy (bolalar mahsuloti) - 8s

```text
Medium tracking shot of a smiling child unboxing a [PEPPY MAHSULOTI] on a bright playroom carpet.
The child lifts the product up toward the camera with excitement.
Background: colorful, tidy playroom with soft toys, softly blurred.
Lighting: bright, soft daylight, cheerful.
Style: family lifestyle commercial, pastel color palette, natural and authentic.
Audio: SFX: box opening, child laughter. Music: playful light ukulele. No dialogue.
Vertical 9:16.
```

## 5. 24 soniyalik reklama - timestamp usuli

3 ta klipni alohida yarating, keyin CapCut/montajda ulang:

```text
Klip 1 [00:00-00:08] HOOK - mahsulot dramatik ko'rinishda (close-up, sekin harakat).
Klip 2 [00:08-00:16] FOYDA - mahsulot ishlatilmoqda (qo'l, odam, natija).
Klip 3 [00:16-00:24] CTA - mahsulot + qadoq bir kadrda, toza fon (matn montajda qo'shiladi).
```

Hook kadri uchun: [`hook-library.md`](hook-library.md).

## 6. Tekshiruv ro'yxati (generatsiyadan oldin)

- [ ] Bitta klip - bitta harakat
- [ ] Format 9:16 (Reels uchun)
- [ ] Mahsulot aniq tasvirlangan (rang, qadoq)
- [ ] Ovoz qismi yozilgan
- [ ] Negative prompt qo'shilgan
- [ ] Matn/yozuv videoga **emas**, montajda qo'shiladi (AI matnni buzadi)
