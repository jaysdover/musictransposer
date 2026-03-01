#!/bin/bash
# download-samples.sh
# Downloads cello MP3 samples from the gleitz MIDI.js soundfonts CDN and saves
# them to samples/cello/ so the app can play them offline via Tone.js Sampler.
#
# Run once from the repo root:
#   bash download-samples.sh
#
# Requirements: curl (pre-installed on macOS and most Linux distros)
# Windows users: run in Git Bash or WSL.
#
# After running, commit the samples/ folder to the repo so the app works offline:
#   git add samples/
#   git commit -m "Add cello soundfont samples"
#
# To revert to the synth fallback without deleting files, set
# SOUNDFONT_ENABLED = false in the audio section of transposer.html.

set -e

BASE="https://gleitz.github.io/midi-js-soundfonts/FluidR3_GM/cello-mp3"
DEST="samples/cello"
NOTES=(C2 Eb2 Gb2 A2 C3 Eb3 Gb3 A3 C4 Eb4 Gb4 A4 C5 Eb5)

mkdir -p "$DEST"

echo "Downloading ${#NOTES[@]} cello samples to ./$DEST/"
echo ""

failed=0
for note in "${NOTES[@]}"; do
    printf "  %-8s" "$note.mp3"
    if curl -sf --max-time 15 -o "$DEST/$note.mp3" "$BASE/$note.mp3"; then
        size=$(wc -c < "$DEST/$note.mp3")
        printf " ✓  (%d KB)\n" "$((size / 1024))"
    else
        printf " ✗  (not found — will be pitch-shifted from nearest sample)\n"
        rm -f "$DEST/$note.mp3"
        ((failed++)) || true
    fi
done

echo ""
total=$(ls "$DEST"/*.mp3 2>/dev/null | wc -l | tr -d ' ')
echo "Downloaded $total / ${#NOTES[@]} samples."

if [ "$total" -eq 0 ]; then
    echo ""
    echo "⚠ No samples downloaded. Check your internet connection and try again."
    echo "  The app will fall back to the built-in synth until samples are available."
    exit 1
elif [ "$failed" -gt 0 ]; then
    echo "⚠ $failed sample(s) were missing from the CDN."
    echo "  Tone.js will pitch-shift from adjacent samples — quality will be fine."
fi

echo ""
echo "✓ Done. To enable offline playback, commit the samples folder:"
echo "    git add samples/"
echo "    git commit -m \"Add cello soundfont samples\""
