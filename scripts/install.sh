#!/usr/bin/env bash
# Install the Lined Paper + Cornell Notes snippets into an Obsidian vault (macOS / Linux).
#
# Usage:  ./scripts/install.sh /path/to/your/vault [--with-templates]
set -euo pipefail

VAULT="${1:-}"
WITH_TEMPLATES="${2:-}"

if [[ -z "$VAULT" || ! -d "$VAULT" ]]; then
  echo "Usage: $0 /path/to/your/vault [--with-templates]" >&2
  exit 1
fi

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SNIPPETS="$VAULT/.obsidian/snippets"
APPEARANCE="$VAULT/.obsidian/appearance.json"

mkdir -p "$SNIPPETS"
cp "$REPO/snippets/lined-paper.css"   "$SNIPPETS/"
cp "$REPO/snippets/cornell-notes.css" "$SNIPPETS/"
echo "Copied snippets to $SNIPPETS"

if [[ "$WITH_TEMPLATES" == "--with-templates" ]]; then
  mkdir -p "$VAULT/Templates"
  cp "$REPO"/templates/*.md "$VAULT/Templates/"
  echo "Copied templates to $VAULT/Templates"
fi

# Switch the snippets on (merges into appearance.json, keeps your other settings).
if command -v python3 >/dev/null 2>&1; then
  python3 - "$APPEARANCE" <<"PY"
import json, os, sys
path = sys.argv[1]
data = {}
if os.path.exists(path):
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
enabled = data.setdefault("enabledCssSnippets", [])
for name in ("lined-paper", "cornell-notes"):
    if name not in enabled:
        enabled.append(name)
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
print("Enabled both snippets in", path)
PY
else
  echo "python3 not found: switch the snippets on manually (Settings > Appearance > CSS snippets)."
fi

echo "Done. Restart Obsidian (or reload) if it was open."
