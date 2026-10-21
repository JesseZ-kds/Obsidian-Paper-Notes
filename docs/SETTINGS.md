# Settings reference

Every setting below appears in **Settings → Style Settings** (community plugin). Without the plugin, edit the matching fallback value in the CSS file, e.g. `var(--lp-line, 36px)`.

The part before the comma is the variable name (`--lp-line`), the part after is the default.

## Lined Paper (`snippets/lined-paper.css`)

### Page layout

| Setting | Variable | Default | What it does |
| ------- | -------- | ------- | ------------ |
| Row height | `--lp-line` | 36px | Height of one ruled line (classic view). |
| Text size | `--lp-text` | 22px | Body text size. |
| Title size | `--lp-title` | 48px | Note title size. |
| Page margin | `--lp-pad-x` | 76px | Space from page edge to text. |
| Margin line gap | `--lp-margin-gap` | 16px | Distance between the red margin line and the text. |
| Rule line position | `--lp-shift` | 6px | Nudges the ruled lines up or down against the text. |
| Callout lift | `--lp-callout-lift` | 0.33 | Vertical alignment of callouts on the lines. |
| Callout box inset | `--lp-callout-inset` | 0.33 | Inner spacing of callout boxes. |
| Callout text size | `--lp-callout-text` | 0.9 | Callout text size relative to body text. |

### A4 page measurements (PDF + page view)

| Setting | Variable | Default | What it does |
| ------- | -------- | ------- | ------------ |
| Page height used | `--lp-print-h` | 290mm | Page height the layout fills (A4 is 297mm). |
| Header (title bar) height | `--lp-bar-lines` | 3 | Title bar height in rows. |
| Body rows | `--lp-body-rows` | 32 | Rows of writing per page. |
| Footer height | `--lp-foot-ratio` | 0.11 | Blank footer as a share of the header height. |
| PDF text scale | `--lp-print-scale` | 0.88 | Text and title size on the A4 sheet vs the classic size. |
| Turn off A4 page view | `lp-no-pages` (toggle) | off | Show one full-width sheet instead of A4 pages in Reading view. |
| Desk | `--lp-desk` | #d9dde3 / #0f121a | Colour behind the pages (light / dark). |

Row height on the page = page height used ÷ (header rows + body rows + footer rows).

### Fonts

| Setting | Variable | Default |
| ------- | -------- | ------- |
| Handwriting font | `--lp-hand` | "Patrick Hand" |
| Title font | `--lp-hand-title` | "Caveat" |

### Colours (light / dark)

| Setting | Variable | Light | Dark |
| ------- | -------- | ----- | ---- |
| Paper | `--lp-paper` | #fffffe | #1c2130 |
| Ruled lines | `--lp-rule` | #c9ddf1 | #2c3650 |
| Red margin line | `--lp-margin` | #f1a7b0 | #7a4350 |
| Title bar background | `--lp-bar` | #fffffe | #1c2130 |
| Text | `--lp-ink` | #1f2937 | #d6deee |
| Title text | `--lp-title-ink` | #111827 | #f1f5ff |
| Muted text (date, labels) | `--lp-muted` | #4b5d85 | #93a4cc |
| Red pen (heading underlines) | `--lp-pen-red` | #c0392b | #ff8a7a |

## Cornell Notes (`snippets/cornell-notes.css`)

| Setting | Variable | Default | What it does |
| ------- | -------- | ------- | ------------ |
| Cue column width | `--cn-cue` | 0.3 | Share of page width (0.3 = 30%). |
| Cue column width on narrow windows | `--cn-cue-narrow` | 0.36 | Used at 600px wide or less. |
| Space either side of the divider | `--cn-gap` | 16px | Gap around the vertical divider. |
| Minimum rows per cue | `--cn-row-min` | 2 | Lines reserved per cue/notes pair. |
| Summary height (rows) | `--cn-summary-rows` | 5 | Summary rows, including its label row. |
| Summary minimum height (rows) | `--cn-summary-min-rows` | 2 | PDF only: smallest the summary may shrink to. |
| Essential question height | `--cn-question-lines` | 2 | Writing lines for the question. |
| Title size | `--cn-label-size` | 0.85 | Size of Question / Summary / Cues / Notes labels vs text. |
| Text size | `--cn-text-size` | 1 | Cue, notes, summary and question text size. |
| Cue column label | `--cn-label-cue` | Cues | Label text. |
| Notes column label | `--cn-label-notes` | Notes | Label text. |
