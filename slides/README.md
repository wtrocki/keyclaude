# Slides

Slide decks built from Markdown via pandoc. One script, four modes.

## Build commands

```bash
# reveal.js HTML (default)
./build.sh "examples/My Deck.md"

# PowerPoint
./build.sh "examples/My Deck.md" --pptx

# HTML + narration audio (floating player, you advance slides manually)
./build.sh "examples/My Deck.md" --narrate
./build.sh "examples/My Deck.md" --narrate --voice Samantha --rate 175

# Read aloud in terminal, slide by slide
./build.sh "examples/My Deck.md" --speak
```

`--narrate` and `--speak` require macOS. List voices: `say -v ?`

## Narration

`--narrate` generates a single `<deck>-narration.m4a` for the whole deck (slides joined with 1.5s silence) and embeds a floating audio player in the HTML. You control slide transitions manually; audio plays continuously.

The `.m4a` file must stay alongside the HTML file to play.

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
