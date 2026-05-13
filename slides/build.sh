#!/usr/bin/env bash
# build.sh — convert a Markdown source in examples/ to a reveal.js HTML slide deck.
#
# Usage:
#   ./build.sh "examples/My Deck.md"
#
# Output: examples/My Deck.html  (same name, .html extension)
# Theme:  templates/mongodb-revealjs.css on top of reveal.js "black" base
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <path-to-markdown>"
  echo "  e.g. $0 'examples/KeyClaude - Project Demo.md'"
  exit 1
fi

INPUT="$1"
OUTPUT="${INPUT%.md}.html"
# Path relative to the output file so browsers resolve it correctly
CSS="../templates/mongodb-revealjs.css"

if ! command -v pandoc &>/dev/null; then
  echo "pandoc not found. Run: brew install pandoc  (or ./install.sh)"
  exit 1
fi

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
