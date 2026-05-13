#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Growth: Quick Capture
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌱
# @raycast.packageName AI Skills
# @raycast.description Capture one growth opportunity from clipboard — saves to growth-opportunities.md
# @raycast.shortcut ctrl+opt+g

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
pbpaste | "$REPO_ROOT/bin/growth-capture"
