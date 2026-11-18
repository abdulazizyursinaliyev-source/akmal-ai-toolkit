# 🖼 Poster / Marketplace Kartochka - JSON Prompt

Mahsulot suratini sotadigan poster va kartochkaga aylantirish tizimi: **Uzum, Wildberries, Ozon, Instagram**.

**Qanday ishlaydi:** mahsulot surati + quyidagi JSON → bitta so'rovda modelga beriladi.

---

## 1. Jarayon (5 qadam)

1. **Mahsulotni o'qish** - nima, rang, qadoq, brend.
2. **Ma'lumot yig'ish** - asosiy foyda (headline) va 3-4 ta xususiyat (spec).
3. **Layout tanlash** - quyidagi 4 tadan biri.
4. **Copy yozish** - headline 1-3 so'z, spec chip'lar 2-3 so'zdan.
5. **JSON + surat** - modelga birga yuborish.

## 2. Layoutlar

| Layout | Qachon ishlatiladi |
|---|---|
| `hero-center` | Bitta mahsulot, cover slayd |
| `split-left-text` | Ko'p xususiyat ko'rsatish kerak |
| `lifestyle` | Mahsulot ishlatilayotgan muhitda |
| `lineup` | Bir nechta rang/ta'm variantlari |

## 3. JSON shablon

```json
{
  "task": "Create a marketplace product poster using the attached product photo",
  "platform": "[uzum | wildberries | ozon | instagram]",
  "aspect_ratio": "[3:4 marketplace | 1:1 feed | 4:5 instagram | 9:16 stories]",
  "product": {
    "name": "[MAHSULOT NOMI]",
    "brand": "[BREND]",
    "keep_exact": true,
    "notes": "Do not redesign, recolor or alter the product or its packaging"
  },
  "layout": "[hero-center | split-left-text | lifestyle | lineup]",
  "copy": {
    "language": "[uz | ru]",
    "headline": "[1-3 SO'Z]",
    "spec_chips": ["[XUSUSIYAT 1]", "[XUSUSIYAT 2]", "[XUSUSIYAT 3]"],
    "badge": "[ixtiyoriy: faqat haqiqiy - masalan 'Yangi']"
  },
  "style": {
    "background": "[FON TAVSIFI]",
    "palette": ["[RANG 1]", "[RANG 2]", "[RANG 3]"],
    "lighting": "soft studio light, gentle shadow under product",
    "typography": "bold clean sans-serif, high contrast, perfectly spelled"
  },
  "constraints": [
    "Text never overlaps the product",
    "Max 25 words total",
    "Max 4 colors",
    "No fake certificates, ratings or discounts",
    "Product occupies 60-70% of the frame"
  ]
}
```

## 4. Tayyor misol - Frutata (Uzum, rus tilida)

```json
{
  "task": "Create a marketplace product poster using the attached product photo",
  "platform": "uzum",
  "aspect_ratio": "3:4",
  "product": {
    "name": "Frutata apple chips",
    "brand": "Frutata",
    "keep_exact": true,
    "notes": "Do not redesign, recolor or alter the product or its packaging"
  },
  "layout": "split-left-text",
  "copy": {
    "language": "ru",
    "headline": "Хрустящие яблоки",
    "spec_chips": ["Без сахара", "100% фрукты", "[VAZN] г"],
    "badge": ""
  },
  "style": {
    "background": "warm cream backdrop with a few fresh apple slices",
    "palette": ["#F6EBD9", "#C8102E", "#2E7D32"],
    "lighting": "soft studio light, gentle shadow under product",
    "typography": "bold clean sans-serif, high contrast, perfectly spelled"
  },
  "constraints": [
    "Text never overlaps the product",
    "Max 25 words total",
    "Max 4 colors",
    "No fake certificates, ratings or discounts",
    "Product occupies 60-70% of the frame"
  ]
}
```

> ⚠️ "Без сахара", "100% фрукты" - faqat mahsulot tarkibi haqiqatan shunday bo'lsa yozing.

## 5. Qaysi model nima uchun

| Model | Kuchli tomoni | Qachon |
|---|---|---|
| Nano Banana / Gemini | Mahsulotni aynan saqlaydi | Asosiy tanlov |
| ChatGPT (rasm) | Matn imlosi eng toza | Ko'p matnli kartochka |
| Midjourney | Chiroyli fon | Faqat fon (clean plate), mahsulot keyin qo'yiladi |

## 6. Carousel - 6 slayd

| # | Slayd | Mazmun |
|---|---|---|
| 1 | Cover | Mahsulot + headline |
| 2 | Lineup | Barcha variantlar/ta'mlar |
| 3 | Features | 3-4 asosiy xususiyat |
| 4 | In use | Mahsulot ishlatilmoqda |
| 5 | In the box | Qadoqda nima bor |
| 6 | Trust | Haqiqiy kafolatlar: yetkazib berish, qaytarish, sertifikat (bor bo'lsa) |

## 7. Platforma talablari (yuklashdan oldin tekshiring)

Har bir marketplace o'lcham va matn qoidalarini vaqti-vaqti bilan o'zgartiradi - yuklashdan oldin sotuvchi kabinetidagi joriy talablarni ko'rib chiqing.
