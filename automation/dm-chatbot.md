# 💬 Instagram DM Avtomatlashtirish

Kalit so'z asosida avtomatik javob beruvchi tizim - mijoz savoliga 24/7 bir zumda javob, operator faqat buyurtmani yopadi.

**Vositalar:** ChatPlace, ManyChat yoki shunga o'xshash (Instagram rasmiy API orqali ishlaydiganlari).

---

## 1. Tizim tuzilishi

```
Mijoz yozadi ──► Kalit so'z topildi? ──ha──► Avto-javob + tugmalar
                        │
                       yo'q
                        ▼
              "Operator tez orada javob beradi" ──► Operatorga xabar
```

## 2. Kalit so'zlar (o'zbek + rus + xato yozilishlar)

| Trigger | Kalit so'zlar |
|---|---|
| `NARX` | narx, narxi, qancha, nech pul, necha, цена, сколько, price |
| `BUYURTMA` | buyurtma, zakaz, olaman, sotib olish, заказ, купить |
| `YETKAZISH` | dostavka, yetkazib, yetkazish, доставка, qachon keladi |
| `MANZIL` | manzil, qayerda, adres, адрес, do'kon qayerda |
| `ULGURJI` | optom, ulgurji, opt, оптом, katta partiya |

## 3. Tayyor javob skriptlari

> `[...]` joylarini haqiqiy ma'lumot bilan to'ldiring. Narxlarni skriptga qattiq yozmang - o'zgarganda eski narx ketib qoladi. Katalog/havola bering.

### NARX
```text
Assalomu alaykum! 😊
Barcha mahsulotlar va narxlar shu yerda: [KATALOG HAVOLASI]
Qaysi mahsulot qiziqtirdi? Rasmini yuboring - aniq narxini aytamiz.
```
Tugmalar: `🛒 Buyurtma berish` · `🚚 Yetkazib berish` · `👤 Operator`

### BUYURTMA
```text
Ajoyib tanlov! 🙌
Buyurtma uchun 3 ta ma'lumot yuboring:
1️⃣ Mahsulot nomi va soni
2️⃣ Ismingiz va telefon raqamingiz
3️⃣ Manzil (shahar, tuman)
Operatorimiz [VAQT] ichida tasdiqlaydi.
```

### YETKAZISH
```text
🚚 Yetkazib berish:
• [SHAHAR] bo'ylab - [MUDDAT]
• Viloyatlarga - [MUDDAT]
• To'lov: [NAQD / KARTA / CLICK / PAYME]
Buyurtma berasizmi?
```

### MANZIL
```text
📍 Bizning manzil: [MANZIL]
🕘 Ish vaqti: [SOAT]
🗺 Xarita: [GOOGLE/YANDEX HAVOLA]
📞 Telefon: [RAQAM]
```

### ULGURJI
```text
Ulgurji hamkorlik uchun rahmat! 🤝
Iltimos yozing: qaysi mahsulot, taxminiy hajm va shahringiz.
Menejerimiz shaxsan bog'lanadi: [TELEGRAM / TELEFON]
```

### Kalit so'z topilmasa (fallback)
```text
Xabaringiz uchun rahmat! 🙏 Operatorimiz tez orada javob beradi.
Tezroq kerak bo'lsa: [TELEFON]
```

## 4. Biznes bo'yicha sozlash

| | Frutata | Peppy |
|---|---|---|
| Asosiy trigger | `ULGURJI`, `NARX` | `NARX`, `BUYURTMA`, `YETKAZISH` |
| Til | O'zbek + rus | O'zbek |
| Ohang | Rasmiy, ishonchli | Iliq, do'stona, emoji ko'proq |
| Qo'shimcha | Sertifikat/hujjatlar savoli → menejer | O'lcham/yosh savoli → katalog |

## 5. Reels → DM "voronka"

Reels caption oxiriga: **"Narxini bilish uchun izohga NARX deb yozing"** → bot avtomatik DM yuboradi. Bu izohlar sonini ham oshiradi (algoritm uchun foydali).

## 6. Qoidalar

- Avto-javobdan keyin **24 soat** ichida operator albatta javob bersin (Instagram qoidasi + mijoz ishonchi).
- Haftada 1 marta: qaysi savollarga bot javob bera olmadi → yangi kalit so'z qo'shing.
- Spam/ommaviy xabar yubormang - akkaunt cheklanadi.

## 7. Keyingi bosqich

- [ ] Telegram bot bilan bir xil skriptlar
- [ ] AI (Claude/GPT) orqali erkin savollarga javob - FAQ asosida
- [ ] Buyurtmalarni Google Sheets'ga avtomatik yozish
