#!/usr/bin/env bash

set -euo pipefail

DOWNLOADS_DIR="${1:-$HOME/Downloads}"
DAYS_OLD="${DAYS_OLD:-30}"

if [[ ! -d "$DOWNLOADS_DIR" ]]; then
  echo "Downloads directory not found: $DOWNLOADS_DIR" >&2
  exit 1
fi

echo "Removing files older than ${DAYS_OLD} days from: $DOWNLOADS_DIR"
find "$DOWNLOADS_DIR" -type f -mtime "+$DAYS_OLD" -print -delete
