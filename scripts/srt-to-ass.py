#!/usr/bin/env python3
"""
srt-to-ass.py — Oddiy .srt subtitrni Reels uslubidagi animatsion .ass ga aylantiradi.

Uslub: so'zma-so'z (karaoke) ajratish, katta qalin shrift, oq matn + sariq faol so'z,
qora kontur, ekranning pastki uchdan biri (safe zone), har satrda "pop" kirish animatsiyasi.

Ishlatish:
    python3 srt-to-ass.py input.srt output.ass [--font "Montserrat"] [--size 86] [--max-words 3]
"""
import argparse
import re
from pathlib import Path

HEADER = """[Script Info]
ScriptType: v4.00+
PlayResX: 1080
PlayResY: 1920
WrapStyle: 2
ScaledBorderAndShadow: yes

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: Reel,{font},{size},&H0000D7FF,&H00FFFFFF,&H00000000,&H80000000,-1,0,0,0,100,100,0,0,1,6,2,2,80,80,{margin_v},1

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
"""

TIME_RE = re.compile(r"(\d+):(\d+):(\d+)[,.](\d+)")


def to_sec(t: str) -> float:
    h, m, s, ms = map(int, TIME_RE.match(t.strip()).groups())
    return h * 3600 + m * 60 + s + ms / 1000


def to_ass(sec: float) -> str:
    cs = int(round(sec * 100))
    h, cs = divmod(cs, 360000)
    m, cs = divmod(cs, 6000)
    s, cs = divmod(cs, 100)
    return f"{h}:{m:02d}:{s:02d}.{cs:02d}"


def parse_srt(text: str):
    blocks = re.split(r"\n\s*\n", text.strip().replace("\r", ""))
    for b in blocks:
        lines = b.strip().split("\n")
        if len(lines) < 2 or "-->" not in lines[1 if lines[0].strip().isdigit() else 0]:
            continue
        ti = 1 if lines[0].strip().isdigit() else 0
        start, end = lines[ti].split("-->")
        yield to_sec(start), to_sec(end), " ".join(lines[ti + 1:]).strip()


def chunk(words, n):
    for i in range(0, len(words), n):
        yield words[i:i + n]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("srt")
    ap.add_argument("ass")
    ap.add_argument("--font", default="Montserrat")
    ap.add_argument("--size", type=int, default=86)
    ap.add_argument("--max-words", type=int, default=3)
    ap.add_argument("--margin-v", type=int, default=520, help="pastdan masofa (Reels UI uchun xavfsiz zona)")
    a = ap.parse_args()

    out = [HEADER.format(font=a.font, size=a.size, margin_v=a.margin_v)]
    pop = r"{\fscx80\fscy80\t(0,120,\fscx105\fscy105)\t(120,200,\fscx100\fscy100)}"

    for start, end, text in parse_srt(Path(a.srt).read_text(encoding="utf-8")):
        words = text.split()
        if not words:
            continue
        per_word = (end - start) / len(words)
        t = start
        for group in chunk(words, a.max_words):
            g_start, g_end = t, t + per_word * len(group)
            # karaoke: \k birligi santisekund; SecondaryColour (oq) → PrimaryColour (sariq)
            k = "".join(rf"{{\k{int(per_word * 100)}}}{w.upper()} " for w in group).strip()
            out.append(f"Dialogue: 0,{to_ass(g_start)},{to_ass(g_end)},Reel,,0,0,0,,{pop}{k}\n")
            t = g_end

    Path(a.ass).write_text("".join(out), encoding="utf-8")
    print(f"✅ {a.ass} tayyor")


if __name__ == "__main__":
    main()
