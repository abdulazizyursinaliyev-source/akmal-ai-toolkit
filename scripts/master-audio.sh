#!/usr/bin/env bash
# master-audio.sh — Ovoz + musiqa + SFX ni aralashtirib, -14 LUFS / -1 dBTP ga master qiladi.
#
# Ishlatish:
#   bash scripts/master-audio.sh -v voice.wav [-m music.mp3] [-s sfx.wav] -o final.wav [-t -14] [-d 0.18]
#
#   -v  ovoz (majburiy)
#   -m  fon musiqasi (ixtiyoriy, ovoz ostida avtomatik pasayadi — sidechain ducking)
#   -s  SFX trek (ixtiyoriy, vaqt bo'yicha tayyor joylashtirilgan bitta fayl)
#   -o  chiqish fayli
#   -t  maqsad LUFS (standart -14: Instagram, TikTok, YouTube)
#   -d  musiqa balandligi (0..1, standart 0.18)
#
# Ikki bosqichli loudnorm ishlatiladi — bir bosqichlidan aniqroq.
set -euo pipefail

TARGET=-14; TP=-1.0; LRA=11; MUSIC_VOL=0.18
VOICE=""; MUSIC=""; SFX=""; OUT=""

while getopts "v:m:s:o:t:d:" opt; do
  case $opt in
    v) VOICE=$OPTARG ;; m) MUSIC=$OPTARG ;; s) SFX=$OPTARG ;;
    o) OUT=$OPTARG ;;  t) TARGET=$OPTARG ;; d) MUSIC_VOL=$OPTARG ;;
    *) echo "Noto'g'ri parametr"; exit 1 ;;
  esac
done
[[ -z "$VOICE" || -z "$OUT" ]] && { echo "Kerak: -v voice -o output"; exit 1; }

TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT

# 1) Ovozni tozalash: past chastota kesish, yengil kompressiya, de-ess
VOICE_CHAIN="highpass=f=80,lowpass=f=14000,acompressor=threshold=-18dB:ratio=3:attack=5:release=80:makeup=3,deesser=i=0.4"

INPUTS=(-i "$VOICE"); FILTER="[0:a]${VOICE_CHAIN},aresample=48000,asplit=2[vox][vkey];"; MIX="[vox]"; N=1; IDX=1

if [[ -n "$MUSIC" ]]; then
  INPUTS+=(-i "$MUSIC")
  # 2) Musiqa ovoz gapirganda avtomatik pasayadi (ducking)
  FILTER+="[${IDX}:a]aresample=48000,volume=${MUSIC_VOL}[mus];[mus][vkey]sidechaincompress=threshold=0.03:ratio=8:attack=20:release=400[duck];"
  MIX+="[duck]"; N=$((N+1)); IDX=$((IDX+1))
else
  FILTER+="[vkey]anullsink;"
fi

if [[ -n "$SFX" ]]; then
  INPUTS+=(-i "$SFX")
  FILTER+="[${IDX}:a]aresample=48000,volume=0.8[sfx];"
  MIX+="[sfx]"; N=$((N+1))
fi

FILTER+="${MIX}amix=inputs=${N}:duration=first:normalize=0,alimiter=limit=0.89[pre]"
ffmpeg -hide_banner -loglevel error -y "${INPUTS[@]}" -filter_complex "$FILTER" -map "[pre]" -c:a pcm_s24le "$TMP/pre.wav"

# 3) Loudnorm 1-bosqich: o'lchash
STATS=$(ffmpeg -hide_banner -i "$TMP/pre.wav" -af "loudnorm=I=${TARGET}:TP=${TP}:LRA=${LRA}:print_format=json" -f null - 2>&1 | sed -n '/^{/,/^}/p')
get() { echo "$STATS" | python3 -c "import sys,json;print(json.load(sys.stdin)['$1'])"; }

# 4) Loudnorm 2-bosqich: aniq normallashtirish
ffmpeg -hide_banner -loglevel error -y -i "$TMP/pre.wav" -af \
"loudnorm=I=${TARGET}:TP=${TP}:LRA=${LRA}:measured_I=$(get input_i):measured_TP=$(get input_tp):measured_LRA=$(get input_lra):measured_thresh=$(get input_thresh):offset=$(get target_offset):linear=true,aresample=48000" \
  "$OUT"

# 5) Tekshiruv
FINAL=$(ffmpeg -hide_banner -i "$OUT" -af "loudnorm=print_format=json" -f null - 2>&1 | sed -n '/^{/,/^}/p')
echo "$FINAL" | python3 -c "import sys,json;d=json.load(sys.stdin);print(f\"✅ Tayyor: {d['input_i']} LUFS, true peak {d['input_tp']} dBTP\")"
