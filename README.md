# Akmal AI Toolkit

> O'zbek biznesi uchun tayyor AI promptlar va ish jarayonlari: reklama videolari, marketplace posterlari, Instagram DM avtomatlashtirish va kontent rejasi.

![Til](https://img.shields.io/badge/til-o'zbek-blue) ![Holat](https://img.shields.io/badge/holat-faol-brightgreen) ![Modellar](https://img.shields.io/badge/modellar-Veo%20%7C%20Gemini%20%7C%20ChatGPT-purple)

Bu repo amaliy ish uchun yig'ilgan: har bir fayl nusxa olib, `[...]` joylarini to'ldirib, darhol ishlatishga mo'ljallangan.

**Qaysi bizneslarda sinalgan:** Frutata (chips), Peppy (do'kon), Instagram - [@ali_rayyon](https://instagram.com/ali_rayyon).

---

## Tarkib

| Bo'lim | Fayl | Nima uchun |
|---|---|---|
| 🎬 Video | [`prompts/video-veo-prompt.md`](prompts/video-veo-prompt.md) | Reels/reklama uchun Veo 3.1 / Gemini video prompt formulasi + tayyor misollar |
| 🖼 Poster | [`prompts/poster-prompt.md`](prompts/poster-prompt.md) | Uzum, Wildberries, Ozon, Instagram uchun mahsulot posteri - JSON shablon |
| 💬 DM bot | [`automation/dm-chatbot.md`](automation/dm-chatbot.md) | Instagram DM kalit so'z javoblari - tayyor skriptlar |
| 📈 Kontent | [`content/instagram-ali-rayyon.md`](content/instagram-ali-rayyon.md) | Instagram o'sish rejasi: rubrikalar, haftalik jadval, KPI |
| 📰 Yangiliklar | [`news/ai-news-log.md`](news/ai-news-log.md) | AI video/rasm sohasidagi muhim yangiliklar va amaliy xulosalar |

---

## Tezkor boshlash (3 daqiqa)

1. **Video kerakmi?** → [`video-veo-prompt.md`](prompts/video-veo-prompt.md) dagi *Umumiy shablon*ni nusxalang, `[MAHSULOT]` ni almashtiring, Gemini/Veo'ga bering. Reels uchun doim **9:16**.
2. **Marketplace kartochkasi kerakmi?** → [`poster-prompt.md`](prompts/poster-prompt.md) dagi JSON'ni to'ldiring va mahsulot surati bilan birga modelga yuboring.
3. **Mijozlar DM'da bir xil savol beryaptimi?** → [`dm-chatbot.md`](automation/dm-chatbot.md) dagi skriptlarni ChatPlace/ManyChat'ga qo'ying.

## Ish oqimi (flow)

```
Mahsulot surati ──► poster-prompt (JSON) ──► Uzum / WB / Ozon kartochka
       │
       └────────► video-veo-prompt ──► 3 × 8s klip ──► Reels (9:16)
                                                         │
                         DM keyword ("narx") ◄────────────┘
                                │
                         dm-chatbot skripti ──► buyurtma
```

## Qoidalar

- `[KVADRAT QAVS]` ichidagi hamma narsa - to'ldirilishi shart bo'lgan joy.
- Narx, chegirma, sertifikat - **faqat haqiqiy** ma'lumot. Soxta da'vo marketplace'da blokka olib keladi.
- Promptlar ingliz tilida (modellar uni yaxshiroq tushunadi), tushuntirishlar o'zbekcha.

## Yo'l xaritasi

- [x] Video prompt formulasi
- [x] Poster JSON shabloni
- [x] DM skriptlar (Frutata, Peppy)
- [ ] O'zbekcha reklama ovozi (TTS) prompt shabloni
- [ ] Telegram bot uchun skriptlar
- [ ] Har bir prompt uchun oldin/keyin natija misollari (`examples/` papka)

## Muallif

**Akmal** - tadbirkor, AI'ni kichik biznesda amaliy qo'llash bo'yicha.
Taklif yoki savol bo'lsa - [Issues](../../issues) bo'limiga yozing.
