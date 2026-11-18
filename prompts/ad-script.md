# 📝 Reklama skripti — 15 / 30 / 60 soniya

## Asosiy tuzilma: H-P-S-P-C

| Qism | 15s | 30s | 60s | Vazifa |
|---|---|---|---|---|
| **H**ook | 0–2 | 0–3 | 0–4 | To'xtatish |
| **P**roblem | 2–5 | 3–8 | 4–15 | Og'riqni tanitish |
| **S**olution | 5–9 | 8–18 | 15–35 | Mahsulot — yechim |
| **P**roof | 9–12 | 18–25 | 35–50 | Isbot: ko'rsatish, haqiqiy fikr, natija |
| **C**TA | 12–15 | 25–30 | 50–60 | Bitta aniq harakat |

**So'z soni (o'zbekcha, tabiiy temp ~2.3 so'z/s):** 15s ≈ 30 so'z · 30s ≈ 65 so'z · 60s ≈ 130 so'z.

## Skript shabloni (jadval)

| Vaqt | Kadr (vizual) | Ovoz (VO) | Ekran matni | SFX |
|---|---|---|---|---|
| 0.0–2.0 | [Hook kadri] | [Hook gapi] | [≤ 6 so'z] | impact |
| 2.0–5.0 | [Muammo] | […] | […] | whoosh |
| 5.0–9.0 | [Mahsulot ko'rinadi — 1-marta] | […] | [Nomi] | pop |
| 9.0–12.0 | [Ishlatilmoqda — 2-marta] | […] | [Foyda] | click |
| 12.0–15.0 | [Mahsulot + CTA — 3-marta] | [CTA] | [CTA] | riser → hit |

## Claude uchun prompt

```text
Sen tajribali reklama kopirayterisan. Quyidagi mahsulot uchun [15/30/60] soniyalik vertikal reklama skriptini H-P-S-P-C tuzilmasida yoz.

Mahsulot: [NOMI]
Kimga: [AUDITORIYA]
Asosiy foyda: [1 TA FOYDA]
Isbot (faqat haqiqiy): [FAKT/FIKR]
CTA: [HARAKAT — masalan "izohga narx deb yozing"]
Ohang: [iliq / energik / premium]

Qoidalar:
- O'zbek lotin yozuvida, og'zaki, tabiiy (kitobiy emas).
- So'z soni: [30/65/130] dan oshmasin.
- Jadval: Vaqt | Kadr | Ovoz | Ekran matni | SFX.
- Mahsulot kamida 3 marta aniq ko'rinsin.
- O'ylab topilgan da'vo, sertifikat, narx yozma. Bilmagan joyni [ ] qoldir.
- Oxirida 3 xil muqobil hook ber.
```

## CTA variantlari

- `Izohga «narx» deb yozing` — DM bot bilan ishlaydi ([dm-chatbot](../automation/dm-chatbot.md))
- `Profildagi havola orqali buyurtma bering`
- `Saqlab qo'ying — keyin kerak bo'ladi` (o'quv kontent uchun)
- `Do'stingizga yuboring, u ham bilsin`
