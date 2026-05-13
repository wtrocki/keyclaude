#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Rewrite: Default
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ✏️
# @raycast.packageName AI Skills
# @raycast.description Rewrite clipboard text for clarity
# @raycast.shortcut ctrl+opt+r

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
pbpaste | "$REPO_ROOT/bin/rewrite" default
