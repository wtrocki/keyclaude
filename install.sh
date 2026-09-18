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
# Prefer opencode; fall back to Claude Code (most users will have claude)
if check opencode; then
  echo "  ok  opencode"
elif check claude; then
  echo "  ok  claude"
else
  echo "  No AI CLI found. Install opencode or claude manually."
  echo "  - opencode: brew install opencode"
  echo "  - claude:   brew install claude"
fi

# ── 2. KeyClaude config ──────────────────────────────────────────────────────

echo ""
echo "==> Creating keyclaude config"
KEYCLAUDE_CONFIG="$HOME/.config/keyclaude/config"
mkdir -p "$(dirname "$KEYCLAUDE_CONFIG")"

# Source existing config if present, so install respects prior settings
[[ -f "$KEYCLAUDE_CONFIG" ]] && source "$KEYCLAUDE_CONFIG"

KEYCLAUDE_DATA_REPO="${KEYCLAUDE_DATA_REPO:-$HOME/notes/data}"
echo "KEYCLAUDE_DATA_REPO=$KEYCLAUDE_DATA_REPO" > "$KEYCLAUDE_CONFIG"
echo "  ok  $KEYCLAUDE_CONFIG → KEYCLAUDE_DATA_REPO=$KEYCLAUDE_DATA_REPO"

# ── 3. Data directories ──────────────────────────────────────────────────────

echo ""
echo "==> Creating data directories"
mkdir -p "$KEYCLAUDE_DATA_REPO/weekly" "$KEYCLAUDE_DATA_REPO/growth/reviews"
echo "  ok  $KEYCLAUDE_DATA_REPO"

# ── 4. AI agent skills ───────────────────────────────────────────────────────

echo ""
echo "==> Installing AI agent skills"
SKILLS_SRC="$REPO_DIR/.claude/skills"

install_skills() {
  local dst="$1"
  mkdir -p "$dst"
  for src in "$SKILLS_SRC"/*/; do
    [[ -f "$src/SKILL.md" ]] || continue
    skill_name="$(basename "$src")"
    dst_dir="$dst/$skill_name"
    mkdir -p "$dst_dir"
    cp "$src/SKILL.md" "$dst_dir/SKILL.md"
    echo "  ok  $dst/$skill_name"
  done
}

install_skills "$HOME/.opencode/skills"
install_skills "$HOME/.claude/skills"

# ── 5. macOS Shortcuts (Rewrite Quick Actions) ────────────────────────────────

echo ""
echo "==> Installing macOS Service shortcuts"
"$REPO_DIR/shortcuts/install.sh"

# ── 6. Done ───────────────────────────────────────────────────────────────────

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
echo "  3. Use /slides in your AI CLI to generate a new slide deck"
