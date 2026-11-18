---
name: brand-design
description: Brend dizayni — logo (brif, generatsiya, vektor, tekshiruv), Taste Skill dizayn tokenlari, marketplace poster, Instagram post/carousel va end card. "Logo qil", "dizayn", "poster", "brend ranglari" so'ralganda ishlat.
---

# Brand Design

## Dizayn tizimi — Taste Skill

Barcha vizual ishlar shu tokenlardan (`templates/brand-tokens.css`). Manba: [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) (MIT).

| Token | Light | Dark | Vazifa |
|---|---|---|---|
| `bg` | `#ffffff` | `#111111` | Fon |
| `surface` | `#f4f4f4` | `#1c1c1c` | Karta, panel |
| `ink` | `#111111` | `#f4f4f4` | Matn |
| `muted` | `#6b6b6b` | `#a3a3a3` | Faqat meta (sana, label) |
| `accent` / `action` | `#1a4be0` | `#ffffff` | Bitta urg'u, tugma |

**Grounds** (kadrda bittadan): sand `#d9ccb7` · sky `#c6d3df` · sage `#cdd6c6` · painting `#79a8d6`.

**Qoidalar:**
1. Bitta aksent. Ikkinchi "brend rangi" qo'shilmaydi.
2. Ajratish **kontrast** bilan (o'lcham, qalinlik, xiralik) — so'z orqasida rangli marker yo'q.
3. Sentence case. Tracked BOSH HARFLI label yo'q.
4. Shrift o'lchamlari: 13 / 14 / 16 / 20 / 28 / 48 / 72. Sarlavha tracking −0.025em.
5. Radius 8 / 12 / 20. Spacing 4…128 shkalasi.
6. Kontrast: matn ≥ 4.5:1, katta matn ≥ 3:1.
7. AI klishelari yo'q: ko'k-binafsha gradient, emoji kartalar, chap chiziqli kartalar.

## Rejimlar

| So'rov | Qadamlar | Manba |
|---|---|---|
| Logo | brif → 4 variant → tanlash → vektor → tekshiruv → animatsiya | `prompts/logo-brand.md`, `templates/logo-reveal.html` |
| Marketplace poster | JSON prompt + mahsulot surati | `prompts/poster-prompt.md` |
| Rasm / fon | formula + lug'at | `prompts/image-design.md` |
| Carousel (6 slayd) | cover → lineup → features → in use → in box → trust | `prompts/poster-prompt.md` |
| End card (video oxiri) | logo + CTA + handle, 2–3 s | `templates/ad-scenes.html` (cta sahna) |

## Poster/post layout to'ri (1080×1350)

```
┌──────────────────────────┐  margin 80px (gut)
│ meta (13–16px, muted)    │
│ Sarlavha 72px, 2 qator   │
│                          │
│      [ MAHSULOT 60% ]    │
│                          │
│ 3 fakt — surface karta   │  gap 24px
│ [ CTA tugma — action ]   │  44px balandlik, radius 8
└──────────────────────────┘
```

## Tekshiruv

- [ ] Faqat tizim ranglari (HEX solishtiring)
- [ ] Bir sahifada bitta tugma uslubi, bitta radius oilasi
- [ ] Mahsulot o'zgartirilmagan
- [ ] Matn mahsulot ustiga tushmaydi
- [ ] Telefonda (390px kenglik) o'qiladi
