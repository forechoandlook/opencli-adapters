#!/usr/bin/env bash
# Sync site YAML trees from an opencli-rs checkout into this plugin repo.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${1:-}"

if [[ -z "$SRC" ]]; then
  # Common sibling layout: ../opencli-rs
  if [[ -d "$ROOT/../opencli-rs/adapters" ]]; then
    SRC="$ROOT/../opencli-rs"
  else
    echo "Usage: $0 /path/to/opencli-rs" >&2
    exit 1
  fi
fi

ADAPTERS="$SRC/adapters"
if [[ ! -d "$ADAPTERS" ]]; then
  echo "Not found: $ADAPTERS" >&2
  exit 1
fi

echo "Syncing from $ADAPTERS -> $ROOT/"
# Remove existing site dirs only (keep repo meta files)
find "$ROOT" -mindepth 1 -maxdepth 1 -type d ! -name '.git' ! -name 'scripts' -exec rm -rf {} +
rsync -a --delete \
  --exclude '.DS_Store' \
  --exclude 'cache.json' \
  "$ADAPTERS/" "$ROOT/"

# rsync may have wiped scripts if adapters had a scripts/ — restore is N/A; we excluded only by keeping scripts dir above.
# If adapters ever ships a top-level scripts/, adjust excludes.

count=$(find "$ROOT" -name '*.yaml' | wc -l | tr -d ' ')
sites=$(find "$ROOT" -mindepth 1 -maxdepth 1 -type d ! -name '.git' ! -name 'scripts' | wc -l | tr -d ' ')
echo "Done: $sites site dirs, $count yaml files"
echo "Remember to bump opencli-plugin.json version + CHANGELOG.md before tagging."
