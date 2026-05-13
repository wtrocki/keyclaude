# Slides

Slide decks built from Markdown via pandoc.

## Build commands

```bash
# reveal.js HTML (default)
./build.sh "examples/My Deck.md"

# PowerPoint
./build.sh "examples/My Deck.md" --pptx
```

## Narration

Use `/slides` in Claude Code — it will ask if you want a narration script and generate `<deck>-narration.txt` for you. Then run:

```bash
say -f "examples/My Deck-narration.txt"
# optional voice/rate:
say -v Samantha -r 175 -f "examples/My Deck-narration.txt"
```

List available voices: `say -v ?`

## Directory layout

```
slides/
  templates/
    mongodb-revealjs.css   CSS theme for reveal.js HTML output
    reference.pptx         PPTX style reference — replace with branded file
  examples/                Source .md + built output pairs
  build.sh                 The one build script
  README.md                This file
```

## Branding the PPTX output

Replace `templates/reference.pptx` with a branded file (your team's colors, fonts, logo). All future `--pptx` builds inherit the new theme.

## Authoring

- `# Title` → title slide
- `## Heading` → one slide per H2
- Keep each slide to 4–6 bullets or one short code block
- Avoid `{width=…}` image attributes in pptx decks

## Skill

Use `/slides <topic>` in Claude Code to generate a new deck end-to-end.
