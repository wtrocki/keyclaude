---
name: slides
description: Generate a reveal.js slide deck or PowerPoint (.pptx) from a topic description. Creates a markdown source file and builds HTML or PPTX output using pandoc.
disable-model-invocation: true
---

You are generating a presentation. Follow these steps in order.

## Step 1 — Determine inputs

Extract from the user's message:
- **topic**: what the presentation is about (required — ask if missing)
- **format**: `html` (reveal.js, default) or `pptx` (PowerPoint)
- **output_dir**: where to save files (default: `slides/examples/` relative to project root)
- **css**: custom CSS path for HTML only (default: `slides/templates/mongodb-revealjs.css` if that file exists, otherwise omit)
- **theme**: reveal.js base theme for HTML only (default: `black`)

## Step 2 — Write the markdown source

Save `<output_dir>/<Topic>.md`. Structure:
- `# Title` — one H1 (title slide)
- `## Slide Title` — each H2 is one slide (pandoc `--slide-level=2`)
- 4–6 bullets or one short code block per slide — no walls of text
- For a project pitch, use this arc: Problem → Solution → How It Works → Architecture → What's Next → Questions
- Adapt the arc to the actual content. Cut slides that don't serve the story.
- Note for pptx: avoid `{width=…}` image attributes and reveal.js-specific fragment syntax — they are ignored or may cause warnings in pptx output.

## Step 3 — Build with pandoc

### HTML (reveal.js)
```bash
pandoc "<input.md>" -t revealjs -s \
  -o "<output.html>" \
  --slide-level=2 \
  -V theme=<theme> \
  [--css "<css_file>"]
```
Omit `--css` if no CSS file is available.

### PowerPoint (.pptx)
```bash
pandoc "<input.md>" -t pptx \
  -o "<output.pptx>" \
  --slide-level=2 \
  [--reference-doc="slides/templates/reference.pptx"]
```
Omit `--reference-doc` if the template does not exist. To apply team branding, replace `slides/templates/reference.pptx` with a branded file — pandoc copies its theme (colors, fonts, layouts) into the output.

Or use the helper script (handles both formats):
```bash
./slides/build.sh "examples/<Topic>.md"           # HTML
./slides/build.sh "examples/<Topic>.md" --pptx    # PowerPoint
```

If pandoc is missing, tell the user to run: `brew install pandoc` (or `install.sh` in the project root).

## Step 4 — Ask about narration

Before building, ask the user: "Should I also generate a narration script you can play with `say`?"

If yes (or they already said `--narrate` / "with narration"):

1. Read the markdown source you just wrote.
2. For each slide (H1 title slide, then each `##` section), produce clean speakable text:
   - Remove code fences and inline code
   - Remove heading markers, bold/italic, bullet prefixes, HTML comments, image/link syntax
   - Keep the natural sentence flow — rewrite fragments into full phrases if needed
3. Write the result to `<output_dir>/<Topic>-narration.txt`, slides joined by ` [[slnc 1500]] `.
4. Tell the user to run:
   ```bash
   say -f "<output_dir>/<Topic>-narration.txt"
   # or with voice/rate:
   say -v Samantha -r 175 -f "<output_dir>/<Topic>-narration.txt"
   ```

## Step 5 — Report

Tell the user:
- Markdown source path (edit this to update content)
- Output path and how to open it
- Exact pandoc command (or build.sh invocation) to rebuild after edits
- If narration was generated: the narration file path and the `say` command to run it
- For pptx: remind them that `slides/templates/reference.pptx` is the branding hook — replace it with a branded template to apply team styles
