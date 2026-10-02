# lib.sh — shared helpers for KeyClaude bin scripts
#
# Provides an `ai` command that prefers `opencode` (if available)
# and falls back to `claude`.

CONFIG_FILE="$HOME/.config/keyclaude/config"
if [[ -f "$CONFIG_FILE" ]]; then
  source "$CONFIG_FILE"
fi
export KEYCLAUDE_DATA_REPO="${KEYCLAUDE_DATA_REPO:-$HOME/notes/data}"

_resolve_weekly() {
  local week="${1:-$(date +"%Y-W%V")}"
  local dir="${2:-$KEYCLAUDE_DATA_REPO/weekly}"
  if [[ -f "$dir/${week}.md" ]]; then
    echo "$week"; return 0
  fi
  if [[ -z "${1:-}" ]]; then
    local latest; latest=$(ls -r "$dir"/????-W??.md 2>/dev/null | head -1)
    [[ -n "$latest" ]] && { basename "$latest" .md; return 0; }
    echo "$week"; return 1
  fi
  echo "$week"; return 1
}

_find_opencode() {
  command -v opencode 2>/dev/null && return
  for dir in "$HOME/.opencode/bin" "$HOME/.local/bin" "/opt/homebrew/bin" "/usr/local/bin"; do
    [[ -x "$dir/opencode" ]] && { echo "$dir/opencode"; return; }
  done
  return 1
}

_OPCODE=$(_find_opencode)
if [[ -n "$_OPCODE" ]]; then
  ai() {
    local attempt=0
    until "$_OPCODE" run "$@" 2>/dev/null; do
      attempt=$((attempt + 1))
      [[ $attempt -ge 3 ]] && return 1
      sleep 2
    done
  }
elif command -v claude &>/dev/null; then
  ai() { claude -p "$@"; }
else
  echo "Error: neither opencode nor claude found" >&2
  exit 1
fi