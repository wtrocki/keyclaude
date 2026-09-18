#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Capture: Save Evidence
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌱
# @raycast.packageName AI Skills
# @raycast.description Save clipboard content as work evidence with optional AI analysis
# @raycast.shortcut ctrl+opt+g

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
pbpaste | "$REPO_ROOT/bin/capture"
