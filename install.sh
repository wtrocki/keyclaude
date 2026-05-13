#!/usr/bin/env bash
# install.sh — install all KeyClaude dependencies and macOS shortcuts.
#
# Run once after cloning. Safe to re-run.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── helpers ──────────────────────────────────────────────────────────────────

check() { command -v "$1" &>/dev/null; }

require_brew() {
  if ! check brew; then
    echo "Homebrew is required but not installed."
    echo "Install it: https://brew.sh"
    exit 1
  fi
}

install_if_missing() {
  local bin="$1" formula="${2:-$1}"
  if check "$bin"; then
    echo "  ok  $bin"
  else
    echo "  installing $formula..."
    brew install "$formula"
  fi
}

# ── 1. Homebrew tools ─────────────────────────────────────────────────────────

echo "==> Checking required tools"
require_brew
install_if_missing pandoc        # slides: markdown → reveal.js HTML
install_if_missing claude        # claude-code: AI agent CLI (tap: anthropics/claude-code)

# claude-code is distributed as an npm package; try npm path if brew misses it
if ! check claude; then
  echo "  installing claude via npm..."
  npm install -g @anthropic-ai/claude-code
fi

# ── 2. GROWTH_REPO data directory ─────────────────────────────────────────────

echo ""
echo "==> Checking GROWTH_REPO"
if [[ -z "${GROWTH_REPO:-}" ]]; then
  DEFAULT_DIR="$HOME/notes/data"
  echo "  GROWTH_REPO is not set — creating default at $DEFAULT_DIR"
  mkdir -p "$DEFAULT_DIR/weekly"
  echo "export GROWTH_REPO=$DEFAULT_DIR" >> "$HOME/.zshrc"
  echo "  Added to ~/.zshrc. Run: source ~/.zshrc"
else
  echo "  ok  GROWTH_REPO=$GROWTH_REPO"
  mkdir -p "$GROWTH_REPO/weekly"
fi

# ── 3. Claude Code skills ─────────────────────────────────────────────────────

echo ""
echo "==> Installing Claude Code skills"
SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"
mkdir -p "$SKILLS_DST"
for src in "$SKILLS_SRC"/*.md; do
  skill_name="$(basename "$src" .md)"
  dst_dir="$SKILLS_DST/$skill_name"
  mkdir -p "$dst_dir"
  cp "$src" "$dst_dir/SKILL.md"
  echo "  ok  /$(basename "$src" .md)"
done

# ── 4. macOS Shortcuts (Rewrite Quick Actions) ────────────────────────────────

echo ""
echo "==> Installing macOS Service shortcuts"
"$REPO_DIR/shortcuts/install.sh"

# ── 5. Done ───────────────────────────────────────────────────────────────────

echo ""
echo "Done."
echo ""
echo "Next steps:"
echo "  1. Assign keyboard shortcuts in:"
echo "     System Settings → Keyboard → Keyboard Shortcuts → Services → Text"
echo "     Suggested: ⌃⌥R = Rewrite: Default   ⌃⌥P = Leadership   ⌃⌥E = External"
echo ""
echo "  2. Try it: select any text → hit ⌃⌥R"
echo ""
echo "  3. Use /slides in Claude Code to generate a new slide deck"
