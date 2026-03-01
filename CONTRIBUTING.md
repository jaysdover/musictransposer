# Contributing to Treble to Cello Transposer

Thank you for your interest in contributing! This is a single-file browser-based music notation tool built for cellists. Contributions of all kinds are welcome — bug fixes, feature ideas, accessibility improvements, and documentation.

## Project structure

The entire application lives in a single file: `transposer.html`. It has no build step, no package manager, and no server-side code. To run it locally, open the file directly in any modern browser (Chrome, Firefox, Safari).

External libraries are loaded via CDN:
- [VexFlow 4.2.5](https://github.com/0xfe/vexflow) — music notation rendering (MIT)
- [jsPDF 2.5.1](https://github.com/parallax/jsPDF) — PDF export (MIT)
- [Tone.js 14.x](https://github.com/Tonejs/Tone.js) — audio playback (MIT)

## How to contribute

1. Fork the repository and create a branch from `main`.
2. Make your changes to `transposer.html`.
3. Test in at least one desktop browser and, if possible, iOS Safari (the primary mobile target).
4. Open a pull request with a clear description of what changed and why.

There is no test suite at this time. Manual testing against the following scenarios is appreciated before submitting:

- Interactive editor: place notes, change key/time signature, undo, clear
- MusicXML import: drag-and-drop and file picker
- All three clef outputs render correctly (bass, tenor, treble)
- Playback reflects the correct pitches for the active key signature
- Export PDF works on desktop; opens in Safari viewer on iOS
- Saved Transpositions: save, load, delete, duplicate title deduplication
- Responsive layout at narrow widths (mobile)

## Coding conventions

- Keep everything in the single `transposer.html` file — no separate JS, CSS, or asset files.
- Vanilla JavaScript only. No frameworks, no npm dependencies.
- New functions should follow the existing section structure (sections are marked with `// ===` comment banners).
- Prefer `const` and `let` over `var`.
- Keep the iOS/mobile experience in mind: use Pointer Events (not mouse/touch events directly), `touch-action` CSS, and test at narrow widths.

## Reporting bugs

Please open a GitHub issue with:
- What you expected to happen
- What actually happened
- Browser and OS (e.g. Safari 17 on iOS 17, Chrome 122 on macOS)
- Steps to reproduce

## Contributor License Agreement

By submitting a pull request, you agree that your contributions are made under the same license as this project (MIT), and you grant the project maintainer the irrevocable right to use, relicense, and sublicense your contributions as part of this project, including for potential future commercial versions. You confirm that you have the right to make the contribution and that it does not include third-party code under an incompatible license.

## Questions

Open an issue or start a discussion on GitHub. This is a small personal project — response times may vary.
