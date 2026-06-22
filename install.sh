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

# ── 3. AI agent skills ───────────────────────────────────────────────────────

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
echo "  3. Use /slides in your AI CLI to generate a new slide deck"
