#!/bin/bash
set -e
fail=0

for file in "$@"; do
  [ -f "$file" ] || continue
  tmp=$(mktemp)
  xmlstarlet fo --indent-spaces 4 "$file" > "$tmp"
  if ! cmp -s "$file" "$tmp"; then
    echo "✗ $file is not properly formatted"
    fail=1
  fi
  rm "$tmp"
done

exit $fail