# lib.sh — shared helpers for KeyClaude bin scripts
#
# Provides an `ai` command supporting both Claude Code (`claude`) and OpenCode 2.0 (`opencode`).
# Prefers `claude` (Claude Code 2.x) by default for clean and fast piped execution,
# falling back to OpenCode 2.0. Can be configured via KEYCLAUDE_AI_BACKEND in
# ~/.config/keyclaude/config (claude|opencode).

export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.opencode/bin:${PATH:-}"

CONFIG_FILE="$HOME/.config/keyclaude/config"
if [[ -f "$CONFIG_FILE" ]]; then
  source "$CONFIG_FILE"
fi
export KEYCLAUDE_DATA_REPO="${KEYCLAUDE_DATA_REPO:-$HOME/notes/data}"
export KEYCLAUDE_AI_BACKEND="${KEYCLAUDE_AI_BACKEND:-${KEYCLAUDE_AI:-auto}}"

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

_run_with_timeout() {
  local sec="$1"
  shift
  if command -v timeout &>/dev/null; then
    timeout "$sec" "$@"
  else
    "$@"
  fi
}

_find_claude() {
  if command -v claude &>/dev/null; then
    command -v claude
    return 0
  fi
  for dir in "$HOME/.local/bin" "/opt/homebrew/bin" "/usr/local/bin"; do
    if [[ -x "$dir/claude" ]]; then
      echo "$dir/claude"
      return 0
    fi
  done
  return 1
}

_find_opencode() {
  if command -v opencode &>/dev/null; then
    command -v opencode
    return 0
  fi
  for dir in "$HOME/.opencode/bin" "$HOME/.local/bin" "/opt/homebrew/bin" "/usr/local/bin"; do
    if [[ -x "$dir/opencode" ]]; then
      echo "$dir/opencode"
      return 0
    fi
  done
  return 1
}

_CLAUDE=$(_find_claude || true)
_OPCODE=$(_find_opencode || true)

_BACKEND="$KEYCLAUDE_AI_BACKEND"
if [[ "$_BACKEND" == "auto" ]]; then
  if [[ -n "$_CLAUDE" ]]; then
    _BACKEND="claude"
  elif [[ -n "$_OPCODE" ]]; then
    _BACKEND="opencode"
  fi
fi

if [[ "$_BACKEND" == "claude" && -n "$_CLAUDE" ]]; then
  ai() {
    local input
    input=$(cat)
    local attempt=0
    until printf '%s' "$input" | _run_with_timeout 60 "$_CLAUDE" -p "$@" 2>/dev/null; do
      attempt=$((attempt + 1))
      [[ $attempt -ge 3 ]] && return 1
      sleep 2
    done
  }
elif [[ "$_BACKEND" == "opencode" && -n "$_OPCODE" ]]; then
  ai() {
    local input
    input=$(cat)
    local attempt=0
    local raw=""
    until raw=$(printf '%s' "$input" | _run_with_timeout 60 "$_OPCODE" run --format json "$@" 2>/dev/null); do
      attempt=$((attempt + 1))
      [[ $attempt -ge 3 ]] && return 1
      sleep 2
    done

    if command -v jq &>/dev/null; then
      printf '%s\n' "$raw" | jq -r -s '[.[] | select(.type=="text") | .part.text] | join("")'
    else
      python3 -c '
import sys, json
out = []
for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        obj = json.loads(line)
        if obj.get("type") == "text":
            out.append(obj.get("part", {}).get("text", ""))
    except Exception:
        pass
print("".join(out), end="")
' <<< "$raw"
    fi
  }
else
  echo "Error: neither claude nor opencode found (or selected backend '$_BACKEND' unavailable)" >&2
  exit 1
fi