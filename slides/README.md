# Slides

reveal.js slide decks built from Markdown via pandoc using lovely green theme.

## Tool

**pandoc** — converts Markdown to self-contained reveal.js HTML.

Install: `brew install pandoc` or run `./install.sh` from the project root.

## Build command

```bash
pandoc "<source.md>" -t revealjs -s \
  -o "<output.html>" \
  --slide-level=2 \
  -V theme=black \
  --css "templates/mongodb-revealjs.css"
```

Run this from the `slides/` directory. Omit `--css` for a plain reveal.js theme.

## Directory layout

```
slides/
  templates/          CSS themes applied via --css
  examples/           Source .md + built .html output pairs
  README.md           This file
```

## Authoring

- `# Title` → title slide
- `## Heading` → one slide per H2
- Keep each slide to 4–6 bullets or one short code block

## Skill

Use `/slides <topic>` in Claude Code to generate a new deck end-to-end.
The skill writes the markdown, runs pandoc, and reports source + output paths.
