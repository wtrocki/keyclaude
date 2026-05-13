#!/usr/bin/env bash
# build.sh — convert a Markdown source to a reveal.js HTML deck or a .pptx file.
#
# Usage:
#   ./build.sh "examples/My Deck.md"          # → HTML (reveal.js)
#   ./build.sh "examples/My Deck.md" --pptx   # → PowerPoint (.pptx)
#
# PPTX template: replace templates/reference.pptx with a branded file to apply
# your team's theme (colors, fonts, logo). Pandoc uses it as a style reference.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <path-to-markdown> [--pptx]"
  echo "  e.g. $0 'examples/KeyClaude.md'"
  echo "       $0 'examples/KeyClaude.md' --pptx"
  exit 1
fi

INPUT="$1"
FORMAT="${2:-}"

if ! command -v pandoc &>/dev/null; then
  echo "pandoc not found. Run: brew install pandoc  (or ./install.sh)"
  exit 1
fi

if [[ "$FORMAT" == "--pptx" ]]; then
  OUTPUT="${INPUT%.md}.pptx"
  REFERENCE="$SCRIPT_DIR/templates/reference.pptx"
  RESOURCE_PATH="$(dirname "$INPUT")"

  REFERENCE_ARG=()
  if [[ -f "$REFERENCE" ]]; then
    REFERENCE_ARG=(--reference-doc="$REFERENCE")
  fi

  pandoc "$INPUT" \
    -t pptx \
    -o "$OUTPUT" \
    --slide-level=2 \
    --resource-path="$RESOURCE_PATH" \
    "${REFERENCE_ARG[@]}"

  echo "Built: $OUTPUT"
else
  OUTPUT="${INPUT%.md}.html"
  CSS="../templates/mongodb-revealjs.css"

  pandoc "$INPUT" \
    -t revealjs -s \
    -o "$OUTPUT" \
    --slide-level=2 \
    -V theme=black \
    --css "$CSS"

  # Pandoc emits data-src for reveal.js lazy loading, but the lazy-load plugin
  # isn't bundled — swap to plain src so images render without it.
  sed -i '' 's/data-src="/src="/g' "$OUTPUT"

  echo "Built: $OUTPUT"
fi
