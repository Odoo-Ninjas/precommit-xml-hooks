#!/bin/bash
set -e

SOURCE_DIR=$(dirname "$(readlink -f "$0")")
XSLT="$SOURCE_DIR/each-attribute-in-line.xslt"

for file in "$@"; do
  cat "$XSLT"
  tmp=$(mktemp)
  xsltproc $XSLT "$file" | xmlstarlet fo > "$tmp"
  mv "$tmp" "$file"
done