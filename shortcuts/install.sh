#!/usr/bin/env bash
# install.sh — symlink the Rewrite Quick Actions from this repo into ~/Library/Services/.
#
# Run once to install; the workflows in shortcuts/ are the source of truth.
# Re-run to update after pulling changes.
#
# After installing:
#   1. Select text in any app
#   2. Right-click → Services → "Rewrite: Default / P&G / External"
#      (or use the keyboard shortcuts you assign below)
#   3. Rewritten text lands in your clipboard; Glass sound plays
#
# Assign keyboard shortcuts:
#   System Settings → Keyboard → Keyboard Shortcuts → Services → Text
#   Suggested: ⌃⌥R = Default   ⌃⌥P = P&G   ⌃⌥E = External
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICES_DIR="$HOME/Library/Services"

link_workflow() {
  local name="$1"
  local src="$SCRIPT_DIR/${name}.workflow"
  local dst="$SERVICES_DIR/${name}.workflow"

  if [[ ! -d "$src" ]]; then
    echo "Error: source not found: $src" >&2
    exit 1
  fi

  # Remove previous copy or symlink if present
  if [[ -e "$dst" || -L "$dst" ]]; then
    rm -rf "$dst"
  fi

  ln -s "$src" "$dst"
  echo "Linked: $dst → $src"
}

link_workflow "Rewrite: Default"
link_workflow "Rewrite: P&G"
link_workflow "Rewrite: External"

echo ""
echo "Done. To assign keyboard shortcuts:"
echo "  System Settings → Keyboard → Keyboard Shortcuts → Services → Text"
echo "  Suggested: ⌃⌥R = Default   ⌃⌥P = P&G   ⌃⌥E = External"
