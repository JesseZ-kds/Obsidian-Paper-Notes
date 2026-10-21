# Obsidian Lined Paper + Cornell Notes

Turn any [Obsidian](https://obsidian.md) note into handwritten-style **ruled paper**, or into a full **Cornell notes** page. Pure CSS: no plugins required, nothing to build.

- **Lined paper**: ruled lines, red margin, handwriting fonts, date in the corner, light and dark mode.
- **A4 page view**: reading view looks like the printed sheet, and **Export to PDF** gives clean A4 pages.
- **Cornell notes**: cue column, notes column, essential question and summary, all on the same ruled paper.
- **Opt-in per note**: only notes that ask for it are styled. Every other note is untouched.
- **Customisable**: sliders, colour pickers and font boxes via the optional Style Settings plugin.

<!-- Add screenshots to docs/images/ and link them here:
![Lined paper](docs/images/lined-paper.png)
![Cornell notes](docs/images/cornell-notes.png)
-->

## Quick start

### 1. Install the snippets

**Option A: installer (recommended)**

```bash
git clone https://github.com/JesseZ-kds/obsidian-paper-notes.git
cd obsidian-lined-paper

# macOS / Linux
./scripts/install.sh "/path/to/your/vault" --with-templates

# Windows (PowerShell)
.\scripts\install.ps1 -Vault "C:\path\to\your\vault" -WithTemplates
```

This copies the CSS into `<vault>/.obsidian/snippets/`, switches both snippets on, and (with the flag) adds the note templates to `<vault>/Templates/`.

**Option B: by hand**

1. Copy `snippets/lined-paper.css` and `snippets/cornell-notes.css` into `<your vault>/.obsidian/snippets/`.
   (The `.obsidian` folder is hidden. On macOS press `Cmd+Shift+.` in Finder.)
2. In Obsidian: **Settings → Appearance → CSS snippets**, click the refresh icon, and switch both on.

> Keep `lined-paper.css` on even if you only want Cornell notes. `cornell-notes.css` is an add-on to it.

### 2. Use it in a note

Add a `cssclasses` property to the note.

**Lined paper**

```yaml
---
cssclasses:
  - lined-paper
date: 2026-10-21
---
```

**Cornell notes** (both classes)

```yaml
---
cssclasses:
  - lined-paper
  - cornell
date: 2026-10-21
---
```

- The note title (the first `# Heading`) becomes the title bar.
- The `date` property shows in the top-right corner. Other properties are hidden.
- Or use the ready-made templates in [`templates/`](templates) and the examples in [`examples/`](examples).

## Writing Cornell notes

Write each cue with its notes as a pair of nested callouts. Cornell layout shows in **Reading view**. While editing you see plain lined paper.

```markdown
# Photosynthesis

> [!question] Essential question
> How do plants turn light into food?

>> [!cue]
>> What is photosynthesis?
>
>> [!notes]
>> Plants turn light, water and CO2 into glucose and oxygen.

>> [!cue]
>> Where does it happen?
>
>> [!notes]
>> In the chloroplasts.

> [!summary] Summary
> The big picture in a few lines.
```

| Block | Required | Notes |
| ----- | -------- | ----- |
| `[!question]` | No | Right under the title. Without it, the *Cues \| Notes* labels sit directly under the title bar. |
| `[!cue]` + `[!notes]` | Yes | Pair them. Separate callouts with a blank line also work. |
| `[!summary]` | No | Must be last. Pinned to the bottom of the page. |

## Customising

Everything can be changed without touching the code.

**Easy way**: install the community plugin **Style Settings** (Settings → Community plugins → Browse → "Style Settings"). Then open **Settings → Style Settings** and look for *Lined Paper* and *Cornell Notes*. You get sliders, colour pickers (separate light and dark colours) and text boxes.

**Manual way**: open the `.css` file, find the `SETTINGS` block and change the fallback value, for example:

```css
--line: var(--lp-line, 36px);   /* change 36px to 32px for tighter rows */
```

Every setting is listed in [`docs/SETTINGS.md`](docs/SETTINGS.md).

## Export to PDF

1. Use the **light** theme (best for printing).
2. Note menu (`⋯`) → **Export to PDF**.
3. Page size: **A4**, Margin: **None**.

The ruled lines, margin and Cornell divider are repeated on every page, and callouts, images, tables and Cornell groups avoid splitting across pages.

## Good to know

- **Fonts** (Patrick Hand and Caveat) load from Google Fonts, so they need an internet connection. Offline, the snippet falls back to Segoe Print, Bradley Hand or Chalkboard SE. You can set any installed font in Style Settings.
- **Page breaks**: CSS can draw A4 pages but cannot push text past a page break, so very long notes may run over a page seam in Reading view. The PDF export is not affected.
- **Turn off the A4 look** (use one full-width sheet instead): Style Settings → Lined Paper → *Turn off A4 page view*.
- **Mobile**: works in the Obsidian mobile apps. Cornell uses a wider cue column on narrow screens.

## Troubleshooting

| Problem | Fix |
| ------- | --- |
| Nothing changes | Check both snippets are switched on, and the note has the `cssclasses` property. Use the refresh icon next to *CSS snippets*. |
| Cornell layout missing | It only shows in **Reading view**, and the note needs **both** `lined-paper` and `cornell`. |
| No settings panel | Install and enable the **Style Settings** plugin. |
| Wrong fonts | You are offline or the font is not installed. See *Good to know*. |
| A property is missing | Only `date` is shown on purpose. Others are hidden. |

## Repository layout

```
obsidian-lined-paper/
├── snippets/
│   ├── lined-paper.css        # the paper (required)
│   └── cornell-notes.css      # Cornell layout (add-on)
├── templates/                 # note templates (core Templates plugin compatible)
│   ├── lined-paper-note.md
│   └── cornell-note.md
├── examples/                  # sample notes to try
├── scripts/
│   ├── install.sh             # macOS / Linux installer
│   └── install.ps1            # Windows installer
├── docs/
│   └── SETTINGS.md            # every setting explained
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## Using the templates

1. Settings → Core plugins → enable **Templates** and set the template folder to `Templates`.
2. Create a note and run **Templates: Insert template**, then pick *lined-paper-note* or *cornell-note*.

## Contributing

Issues and pull requests are welcome. Each CSS file starts with a header explaining its sections. If you change a setting, update both the `@settings` block and [`docs/SETTINGS.md`](docs/SETTINGS.md), and add a line to [`CHANGELOG.md`](CHANGELOG.md).

## License

[MIT](LICENSE)
