# 🎨 Rasm va dizayn promptlari

Rasm modellari (Nano Banana / Gemini, GPT Image, Midjourney, Flux) uchun yagona tizim.

## Formula

```
[Subyekt] + [Kompozitsiya] + [Yorug'lik] + [Uslub/Material] + [Rang] + [Texnik] + [Taqiqlar]
```

## Kalit so'zlar lug'ati

| Kategoriya | Professional atamalar |
|---|---|
| Kompozitsiya | centered hero, rule of thirds, flat lay (top-down), negative space left, low angle, macro |
| Yorug'lik | soft window light, golden hour, studio softbox, rim light, hard shadow, overcast diffused |
| Kamera | 85mm portrait, 35mm documentary, 100mm macro, shallow depth of field f/1.8 |
| Uslub | editorial, minimal Scandinavian, premium commercial, lifestyle candid, claymation, isometric 3D |
| Material | matte paper, frosted glass, brushed metal, linen, ceramic, glossy plastic |
| Rang grading | warm cream, cool muted, high-key bright, low-key moody, pastel |

## Tayyor shablonlar

### Mahsulot — studiya
```text
Premium product photo of [MAHSULOT], centered on a [MATERIAL] pedestal, soft studio softbox from top-left, gentle contact shadow, background in [HEX] seamless paper, generous negative space above for text, 85mm, f/8, ultra sharp, no text, no logo changes.
```

### Mahsulot — lifestyle
```text
Candid lifestyle photo: [ODAM] using [MAHSULOT] in a [JOY], natural window light, warm tones, shallow depth of field, authentic not posed, 35mm, product clearly visible and unchanged.
```

### Flat lay
```text
Top-down flat lay of [MAHSULOT] surrounded by [3-4 TEGISHLI NARSA] on a [FON] surface, symmetrical arrangement, soft even light, [RANG] palette, editorial magazine style.
```

### Ijtimoiy tarmoq fon (matn uchun joy)
```text
Minimal abstract background, [HEX1] to [HEX2] subtle grain, soft light falloff from top right, large empty area in the center for typography, 4:5.
```

## Brend ranglari (Taste Skill)

Promptga HEX bilan bering — model aniqroq ushlaydi:

| Token | HEX | Qayerda |
|---|---|---|
| ink | `#111111` | Matn, qorong'i fon |
| surface | `#f4f4f4` | Yorug' fon |
| accent | `#1a4be0` | Bitta urg'u (tugma, belgi) |
| sand | `#d9ccb7` | Iliq fon (oziq-ovqat, bolalar) |
| sky | `#c6d3df` | Sovuq fon (texnika) |
| sage | `#cdd6c6` | Tabiiy fon (eko, meva) |

## Taqiqlar (negative)

```text
no text, no watermark, no extra fingers, no distorted packaging, no fake logos, no oversaturated colors, no plastic skin
```

## Tahrirlash promptlari (mavjud rasmni o'zgartirish)

- Fon almashtirish: `Keep the product exactly as is. Replace only the background with [FON].`
- Yorug'lik: `Relight the scene with warm golden hour light from the left, keep everything else identical.`
- Kengaytirish: `Extend the canvas to 9:16, continue the background naturally, product stays untouched.`
