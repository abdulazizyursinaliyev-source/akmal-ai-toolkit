#!/usr/bin/env bash
# assemble-video.sh — AI klip(lar)ni bitta 9:16 videoga yig'adi, master audio va subtitr qo'shadi.
#
# Ishlatish:
#   bash scripts/assemble-video.sh -a final.wav -o reel.mp4 [-s subs.ass] [-r 1080x1920] clip1.mp4 clip2.mp4 ...
#
#   -a  master audio (master-audio.sh natijasi)
#   -s  .ass yoki .srt subtitr (ixtiyoriy — "kuydirib" qo'yiladi)
#   -r  o'lcham (standart 1080x1920)
#   Klip orasida 0.25s crossfade. Video audio uzunligiga qarab qirqiladi.
set -euo pipefail

RES=1080x1920; AUDIO=""; SUBS=""; OUT=""; XF=0.25
while getopts "a:s:o:r:" opt; do
  case $opt in a) AUDIO=$OPTARG ;; s) SUBS=$OPTARG ;; o) OUT=$OPTARG ;; r) RES=$OPTARG ;; *) exit 1 ;; esac
done
shift $((OPTIND-1))
[[ $# -lt 1 || -z "$AUDIO" || -z "$OUT" ]] && { echo "Kerak: -a audio -o out clip1 [clip2...]"; exit 1; }

W=${RES%x*}; H=${RES#*x}
INPUTS=(); FILTER=""; i=0
for c in "$@"; do
  INPUTS+=(-i "$c")
  FILTER+="[${i}:v]scale=${W}:${H}:force_original_aspect_ratio=increase,crop=${W}:${H},fps=30,format=yuv420p,setsar=1[v${i}];"
  i=$((i+1))
done

# Crossfade zanjiri
PREV="v0"; OFFSET=0
for ((k=1; k<i; k++)); do
  D=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "${@:$k:1}")
  OFFSET=$(python3 -c "print(round($OFFSET + $D - $XF, 3))")
  FILTER+="[${PREV}][v${k}]xfade=transition=fade:duration=${XF}:offset=${OFFSET}[x${k}];"
  PREV="x${k}"
done

if [[ -n "$SUBS" ]]; then
  FILTER+="[${PREV}]subtitles='${SUBS}'[vout]"
else
  FILTER+="[${PREV}]null[vout]"
fi

ffmpeg -hide_banner -loglevel error -y "${INPUTS[@]}" -i "$AUDIO" \
  -filter_complex "$FILTER" -map "[vout]" -map "${i}:a" \
  -c:v libx264 -preset slow -crf 18 -profile:v high -pix_fmt yuv420p \
  -c:a aac -b:a 192k -ar 48000 -movflags +faststart -shortest "$OUT"

echo "✅ Video tayyor: $OUT ($(ffprobe -v error -show_entries format=duration -of csv=p=0 "$OUT" | cut -c1-5)s)"
