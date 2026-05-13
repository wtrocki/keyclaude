# Raycast Shortcuts

Three Script Commands for rewriting text via the clipboard. Each reads from clipboard, calls `bin/rewrite`, and writes the result back to clipboard.

## Commands

| Command | Key | What it does |
|---------|-----|-------------|
| Rewrite: Default | `⌃⌥R` | Tighten any internal message — Slack, email, doc comment |
| Rewrite: Leadership | `⌃⌥P` | Outcome-first rewrite with evidence flags and Leadership Principle tagging |
| Rewrite: External | `⌃⌥E` | Strip internals, add context for public-facing content |

## Setup

1. [Install Raycast](https://www.raycast.com/) if you haven't already.
2. Open **Raycast → Settings → Extensions → Script Commands**.
3. Click **Add Directories** and select this `shortcuts/raycast/` folder.
4. The three commands appear immediately with keyboard shortcuts pre-configured.

Raycast picks up file changes live — pulling this repo updates the commands automatically.

## Usage

1. Copy the text you want to rewrite (`⌘C`)
2. Trigger the shortcut (`⌃⌥R`, `⌃⌥P`, or `⌃⌥E`)
3. Paste the result (`⌘V`)

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Commands not appearing | Confirm `shortcuts/raycast/` is added in Raycast → Settings → Extensions → Script Commands |
| Permission denied | Run `chmod +x shortcuts/raycast/*.sh` from the repo root |
| Empty clipboard after trigger | Run `pbpaste \| bin/rewrite default` in terminal to see the error |
| `claude: command not found` | Add `~/.local/bin` and `/opt/homebrew/bin` to `PATH` in your shell profile |
| Shortcut conflicts | Reassign in Raycast → Settings → Extensions → find "AI Skills" → edit shortcut |
