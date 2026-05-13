# Slides

Slide decks built from Markdown via pandoc. Supports two output formats:
- **reveal.js HTML** — browser-based, MongoDB-branded CSS theme
- **PowerPoint (.pptx)** — for sharing or presenting in standard slide tools

## Tool

**pandoc** — converts Markdown to reveal.js HTML or .pptx.

Install: `brew install pandoc` or run `./install.sh` from the project root.

## Build commands

### Using the helper script (recommended)

```bash
# from the slides/ directory
./build.sh "examples/My Deck.md"           # → HTML (reveal.js)
./build.sh "examples/My Deck.md" --pptx    # → PowerPoint (.pptx)
```

### Manual pandoc

```bash
# HTML (reveal.js)
pandoc "<source.md>" -t revealjs -s \
  -o "<output.html>" \
  --slide-level=2 \
  -V theme=black \
  --css "templates/mongodb-revealjs.css"

# PowerPoint
pandoc "<source.md>" -t pptx \
  -o "<output.pptx>" \
  --slide-level=2 \
  --reference-doc="templates/reference.pptx"
```

Run from the `slides/` directory.

## Directory layout

```
slides/
  templates/
    mongodb-revealjs.css   CSS theme for reveal.js HTML output
    reference.pptx         PPTX style reference — replace with a branded
                           file to apply team colors, fonts, and layouts
  examples/                Source .md + built output pairs (.html / .pptx)
  build.sh                 Helper script (supports both formats)
  README.md                This file
```

## Branding the PPTX output

`templates/reference.pptx` ships as pandoc's default template. To apply your team's branding:

1. Open the file in PowerPoint and update slide masters with your colors, fonts, and logo.
2. Save it back as `templates/reference.pptx`.
3. All future `--pptx` builds will inherit the new theme.

Alternatively, supply any branded `.pptx` file via `--reference-doc`.

## Authoring

- `# Title` → title slide
- `## Heading` → one slide per H2
- Keep each slide to 4–6 bullets or one short code block
- Avoid `{width=…}` image attributes in pptx decks — they are reveal.js-specific and will be ignored

## Skill

Use `/slides <topic>` in Claude Code to generate a new deck end-to-end.
The skill writes the markdown, runs pandoc, and reports source + output paths.
Pass `--pptx` in your message to get a PowerPoint file instead of HTML.
