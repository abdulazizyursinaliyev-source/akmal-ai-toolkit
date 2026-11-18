# 🪝 Hook kutubxonasi — birinchi 2 soniya

Tomoshabin 1–2 soniyada qaror qiladi. Hook = **vizual + matn + ovoz** birga ishlaydi.

## Hook formulasi

```
HOOK = [Kutilmagan kadr] + [Katta matn ≤ 6 so'z] + [Impact tovush]
```

| Qatlam | Qoida |
|---|---|
| Vizual | 0-kadrdan harakat. Sekin "intro" yo'q. Yaqin plan yoki kutilmagan burchak |
| Matn | Ekranning yuqori-o'rta qismi, ≤ 6 so'z, sentence case |
| Ovoz | 0.0s da "impact"/"whoosh"; birinchi so'z 0.3s dan kechikmasin |
| Tezlik | Birinchi kesish (cut) ≤ 1.5s da |

## 12 turdagi hook — o'zbekcha shablonlar

| # | Turi | Shablon | Misol |
|---|---|---|---|
| 1 | Savol | `[Auditoriya] hali ham [xato] qilyaptimi?` | Ota-onalar hali ham shuni xato qilyapti? |
| 2 | Raqam | `[N] soniyada [natija]` | 30 soniyada reklama video |
| 3 | Taqiq | `Hech qachon [narsa] qilmang` | Hech qachon bolaga telefon bermang — bundan oldin |
| 4 | Sir | `Buni hech kim aytmaydi:` | Marketplace'da buni hech kim aytmaydi |
| 5 | Oldin/keyin | `Oldin: … / Keyin: …` (split-screen) | Oddiy surat → reklama poster |
| 6 | Xato | `Men [N] yil shu xatoni qildim` | 3 yil shu xatoni qildim |
| 7 | Natija avval | Natijani 1-kadrda ko'rsat, keyin "qanday?" | Tayyor video → "Buni AI qildi" |
| 8 | Qarama-qarshi | `Hamma [X] deydi. Aslida — [Y]` | Hamma qimmat deydi. Aslida — yo'q |
| 9 | Ro'yxat | `[N] ta [narsa], [3-chisi] eng zo'ri` | 3 ta AI vosita, 3-chisi bepul |
| 10 | POV | `POV: [vaziyat]` | POV: bolangiz 1 soat telefonsiz o'ynadi |
| 11 | Sinov | `[Narsa]ni sinab ko'rdim — natija:` | Veo 3.1 ni sinab ko'rdim |
| 12 | ASMR / sensor | Ovozsiz matn, faqat tovush (qirsillash, ochilish) | Chips paketi ochilishi — yaqin plan |

## Hook vizual promptlari (video model uchun, 2–4s)

```text
Extreme close-up, fast push-in on [MAHSULOT], a hand slams it onto the table, dust particles in light, 0.2s motion blur. Vertical 9:16. SFX: heavy impact thud.
```
```text
Split-screen vertical: left side dull grey [OLDIN holat], right side vivid colorful [KEYIN holat], a wipe transition sweeps left to right. 9:16.
```
```text
POV handheld shot looking down at [VAZIYAT], natural daylight, slight camera shake, authentic phone-footage feel. 9:16.
```

## Tekshiruv

- [ ] Ovozsiz ham tushunarli (matn bor)
- [ ] 1-kadr — harakat bor, logo yo'q
- [ ] Va'da video oxirida bajariladi (aldov hook — obunani yo'qotadi)
