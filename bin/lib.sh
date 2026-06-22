# lib.sh — shared helpers for KeyClaude bin scripts
#
# Provides an `ai` command that prefers `opencode` (if available)
# and falls back to `claude`.

if command -v opencode &>/dev/null; then
  ai() {
    opencode run "$@"
  }
elif command -v claude &>/dev/null; then
  ai() {
    claude -p "$@"
  }
else
  echo "Error: neither opencode nor claude found in PATH" >&2
  exit 1
fi