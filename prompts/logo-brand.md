# ✳️ Logo va brend identifikatsiyasi

## 1. Brif (logo qilishdan oldin)

```yaml
brand: [NOMI]
what: [nima sotadi — 1 jumla]
audience: [kimga]
3_words: [brend xarakteri — masalan: iliq, ishonchli, quvnoq]
avoid: [nima bo'lmasin — masalan: bolalarcha emas, qimmat ko'rinmasin]
competitors: [2-3 raqobatchi — ulardan farqlanish uchun]
usage: [Instagram avatar, qadoq, peshtaxta, favicon]
```

## 2. Logo turlari

| Tur | Tavsif | Kimga mos |
|---|---|---|
| Wordmark | Faqat nom, maxsus shrift | Qisqa nom (Peppy, Frutata) |
| Lettermark | Bosh harf(lar) | Uzun nom |
| Pictorial | Belgi/rasm | Tanilgan brend |
| Combination | Belgi + nom | Yangi brend — eng xavfsiz |
| Emblem | Nom belgi ichida | An'anaviy, premium oziq-ovqat |

## 3. Generatsiya prompti

```text
Minimal [TUR] logo for "[NOMI]", a [SOHA] brand. Concept: [G'OYA — masalan: olma bo'lagi + tabassum].
Flat vector, solid fills, no gradients, no shadows, no 3D, geometric construction, works at 16px.
Colors: [HEX1] and [HEX2] only, on white background. Centered, generous padding.
Typography (if any): clean geometric sans-serif, perfectly spelled "[NOMI]".
```

**Variatsiyalar uchun:** bir xil promptni 4 marta ishlating, eng yaxshisini tanlab, keyin: `Same logo, simplify further, remove smallest details.`

## 4. AI rasmdan → toza vektor

AI logo rasm (PNG) beradi; professional ish uchun **SVG** kerak:
1. Eng yaxshi variantni tanlang.
2. Vektorlashtiring (Illustrator Image Trace, Inkscape Trace Bitmap yoki vectorizer vositalari).
3. Qo'lda tozalang: nuqtalarni kamaytiring, egri chiziqlarni tekislang.
4. Shriftni haqiqiy shrift bilan qayta yozing (AI harflarni buzadi).

## 5. Logo tekshiruvi

- [ ] 16×16 px da (favicon) taniladimi?
- [ ] Oq-qora variantda ishlaydimi?
- [ ] Qorong'i fonda (`#111111`) ishlaydimi?
- [ ] Mashhur brendga o'xshamaydimi? (o'xshasa — huquqiy xavf)
- [ ] Nom to'g'ri yozilganmi?

## 6. Brend to'plami (logo'dan keyin)

| Element | Qiymat |
|---|---|
| Asosiy rang | [HEX] |
| Ikkinchi rang | [HEX] |
| Neytral | `#111111`, `#f4f4f4` |
| Shrift (sarlavha) | [masalan: Inter 500] |
| Shrift (matn) | [Inter 400] |
| Radius | 8 / 12 / 20 px |
| Logo atrofidagi bo'sh joy | logo balandligining 25% |

Animatsiya qilish: [`templates/logo-reveal.html`](../templates/logo-reveal.html) — SVG'ingizni qo'ying, `render-html.js` bilan MP4 qiling.
