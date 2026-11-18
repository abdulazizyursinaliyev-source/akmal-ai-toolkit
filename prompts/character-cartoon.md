# 🧸 Multfilm personaj — dizayn, izchillik, animatsiya

Bitta personajni 10+ videoda **bir xil** saqlash — eng qiyin va eng qimmatli ish. Tizim: **Character sheet → Reference lock → Sahna promptlari**.

## 1. Personaj pasporti (avval to'ldiring)

```yaml
name: [ISM]
role: [brend maskoti / hikoya qahramoni]
age_look: [masalan: 6 yoshli bola ko'rinishida]
species: [bola / hayvon / meva / predmet]
silhouette: [1 jumla — uzoqdan tanilsin: "katta yumaloq bosh, kichik tana"]
colors: [3 ta asosiy rang HEX bilan]
signature_item: [doimiy belgi: sariq sharf / ko'k kepka]
personality: [3 so'z: quvnoq, qiziquvchan, sabrsiz]
voice: [ovoz tavsifi — ElevenLabs uchun]
never: [nima qilmaydi / kiymaydi]
```

## 2. Character sheet prompt (rasm modeli)

```text
Character design reference sheet of [ISM], an original cartoon character: [SILHOUETTE], [SPECIES], wearing [SIGNATURE ITEM].
Color palette strictly: [HEX1], [HEX2], [HEX3].
Three panels on a plain light-grey background: front view, 3/4 view, side view, full body, neutral T-pose.
Below: 6 facial expressions (happy, surprised, sad, angry, thinking, laughing).
Style: [3D Pixar-like soft render | 2D flat vector | claymation], clean edges, consistent proportions, no text, no logo.
```

**Uslub tanlash:**

| Uslub | Kuchli tomoni | Qachon |
|---|---|---|
| 3D soft (Pixar-ga o'xshash) | Premium, bolalarga yoqadi | Peppy, bolalar mahsuloti |
| 2D flat vector | Tez, arzon, izchil | Ta'limiy, infografika |
| Claymation | Noyob, "qo'lda yasalgan" hissi | Brend hikoyasi |
| Anime | Yoshlar auditoriyasi | Trend kontent |

> Mashhur studiya personajlariga o'xshatmang — original dizayn qiling (huquqiy xavf).

## 3. Izchillik qoidalari (consistency lock)

1. Character sheet'dan **bitta eng yaxshi old ko'rinish** tanlang → bu "reference image".
2. Har bir sahna promptiga reference image'ni yuklang (Veo 3.1 "ingredients", Kling "elements", Runway "references").
3. Promptda har safar **bir xil tavsif blokini** so'zma-so'z takrorlang (pasportdagi silhouette + colors + signature item).
4. Bitta sahnada bitta personaj harakat qilsin — ikkinchisi fon.

## 4. Sahna prompti (video)

```text
[CHARACTER BLOCK — pasportdan so'zma-so'z].
Scene: [JOY], [VAQT/YORUG'LIK].
Action: [ISM] [BITTA HARAKAT], then [REAKSIYA — ifoda sheet'dagi kabi].
Camera: [medium shot, slow push-in].
Style: matches the reference image exactly, same proportions and colors.
Audio: [ISM] says in Uzbek: "[GAP]" — [ovoz tavsifi]. SFX: [tovush]. Music: [uslub].
Vertical 9:16, 8 seconds.
```

## 5. Hikoya

Hikoya tuzilmasi (6 bit) — [`skills/story-hook-character`](../skills/story-hook-character/SKILL.md), STORY rejimi.

## 6. Lab-sinxron (lip-sync)

Ovozni avval yarating ([voiceover.md](voiceover.md)) → video modelga audio bilan bering yoki keyin lip-sync vositasida moslang. O'zbekcha uchun: qisqa gaplar, aniq bo'g'inlar.
