---
name: slides
description: Generate a reveal.js slide deck from a topic description. Creates a markdown source file and builds HTML output using pandoc.
---

You are generating a reveal.js presentation. Follow these steps in order.

## Step 1 — Determine inputs

Extract from the user's message:
- **topic**: what the presentation is about (required — ask if missing)
- **output_dir**: where to save files (default: `slides/examples/` relative to project root)
- **css**: custom CSS path (default: `slides/templates/mongodb-revealjs.css` if that file exists, otherwise omit)
- **theme**: reveal.js base theme (default: `black`)

## Step 2 — Write the markdown source

Save `<output_dir>/<Topic>.md`. Structure:
- `# Title` — one H1 (title slide)
- `## Slide Title` — each H2 is one slide (pandoc `--slide-level=2`)
- 4–6 bullets or one short code block per slide — no walls of text
- For a project pitch, use this arc: Problem → Solution → How It Works → Architecture → What's Next → Questions
- Adapt the arc to the actual content. Cut slides that don't serve the story.

## Step 3 — Build with pandoc

```bash
pandoc "<input.md>" -t revealjs -s \
  -o "<output.html>" \
  --slide-level=2 \
  -V theme=<theme> \
  [--css "<css_file>"]
```

Omit `--css` if no CSS file is available.
If pandoc is missing, tell the user to run: `brew install pandoc` (or `install.sh` in the project root).

## Step 4 — Report

Tell the user:
- Markdown source path (edit this to update content)
- HTML output path (open in browser)
- Exact pandoc command to rebuild after edits
