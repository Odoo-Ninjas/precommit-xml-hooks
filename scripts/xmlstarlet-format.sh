#!/bin/bash
set -e
INDENT=2

for file in "$@"; do
  [ -f "$file" ] || continue
  tmp=$(mktemp)
  xmlstarlet fo --indent-spaces $INDENT "$file" > "$tmp"
  if ! cmp -s "$file" "$tmp"; then
    cp "$tmp" "$file"
  fi
  rm "$tmp"
done