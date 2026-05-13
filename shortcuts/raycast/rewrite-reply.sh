#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Rewrite: Reply
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💬
# @raycast.packageName AI Skills
# @raycast.description Polish a PR or doc comment reply
# @raycast.shortcut ctrl+opt+y

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
pbpaste | "$REPO_ROOT/bin/rewrite-reply"
