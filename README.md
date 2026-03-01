# Treble to Cello Transposer

A single-file browser app that converts treble clef sheet music into bass and tenor clef notation for cello. No installation, no server, no build step — open `transposer.html` in any modern browser and start playing.

---

## Features

- **Interactive note editor** — click on a staff to place notes; supports whole, half, quarter, eighth, and sixteenth note durations, sharps, flats, dots, ties, and rests
- **MusicXML import** — drag and drop or browse for `.musicxml`, `.xml`, or `.mxl` files
- **Three clef outputs** — bass clef, tenor clef, and treble G clef rendered simultaneously
- **Audio playback** — realistic cello soundfont playback with key-signature-aware pitch accuracy; adjustable BPM. Falls back to a built-in synth if samples are not present.
- **PDF export** — export any clef output as a landscape letter PDF; iOS-compatible
- **Saved transpositions** — save work locally in the browser, reload it later, and pick up where you left off
- **Responsive layout** — works on desktop, iPad, and iPhone (open in Safari, not Files preview)

---

## Getting started

Download `transposer.html` and open it in your browser. That's it.

On **iOS**, open the file directly in Safari (long press → Share → Open in Safari). Opening via the Files app preview will disable JavaScript and the app will not function.

---

## Usage

### Interactive editor

1. Select a note duration from the toolbar (Whole → Sixteenth)
2. Optionally toggle a sharp, flat, or dot modifier
3. Click anywhere on the staff to place a note at that pitch
4. Set the key and time signature from the dropdowns
5. Give your piece a title, then hit **💾 Save Current Work** at any time

Bass clef, tenor clef, and treble outputs update automatically as you add notes.

### MusicXML import

1. Switch to the **Import MusicXML** tab
2. Drag and drop a file onto the drop zone, or click to browse
3. All three clef outputs render immediately
4. Use **Export PDF** or **Print** to save — the piece is also saved automatically to your Saved Transpositions list

### Saved transpositions

The panel on the right (or bottom on mobile) lists all saved pieces. Tap any entry to load it back into the interactive editor. A title is required before saving — if a title is already in use, a sequential number is appended automatically (e.g. "Twinkle Twinkle (2)").

---

## Browser support

| Browser | Status |
|---|---|
| Safari (macOS / iOS) | ✅ Full support |
| Chrome (desktop) | ✅ Full support |
| Firefox (desktop) | ✅ Full support |
| Edge (desktop) | ✅ Full support |
| iOS Files app preview | ❌ JavaScript disabled by QuickLook |

---

## Dependencies

All loaded via CDN — no npm install required.

| Library | Version | Purpose | License |
|---|---|---|---|
| [VexFlow](https://github.com/0xfe/vexflow) | 4.2.5 | Music notation rendering | MIT |
| [jsPDF](https://github.com/parallax/jsPDF) | 2.5.1 | PDF export | MIT |
| [Tone.js](https://github.com/Tonejs/Tone.js) | 14.x | Audio playback | MIT |

---

## Hosting

The app is a single static HTML file and can be hosted anywhere that serves static files:

- **GitHub Pages** — push to a repo and enable Pages in settings
- **Netlify / Cloudflare Pages** — drag and drop the file to deploy
- **Local** — open `transposer.html` directly in a browser

No backend, database, or environment variables are required. Saved transpositions are stored in the browser's `localStorage` and are local to each device.

---

## Cello soundfont setup

The app ships with a triangle-wave synth fallback that works with no setup. For realistic cello playback, download the sample files by running the included script once from the repo root:

```bash
bash download-samples.sh
```

This downloads ~14 MP3 files (~3–5 MB total) from the [gleitz MIDI.js soundfonts CDN](https://github.com/gleitz/midi-js-soundfonts) into `samples/cello/`. Commit that folder to your repo for fully offline playback. The app detects the samples on load and shows **🎻 Cello soundfont ready** in the playback bar when they are available.

To revert to the synth at any time, set `SOUNDFONT_ENABLED = false` near the top of the audio section in `transposer.html` — no other changes needed.

---

## Roadmap

- Cloud sync for saved transpositions (Supabase)
- MIDI export
- Combined multi-clef PDF layout
- Playback cursor tracking position in score

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see [LICENSE](LICENSE).
