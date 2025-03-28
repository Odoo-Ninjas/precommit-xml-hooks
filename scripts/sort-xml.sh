#!/bin/bash
set -e

SOURCE_DIR=$(dirname "$(readlink -f "$0")")
XSLT="$SOURCE_DIR/sort-attrs.xslt"

for file in "$@"; do
  tmp=$(mktemp)
  xsltproc $XSLT "$file" | xmlstarlet fo > "$tmp"
  mv "$tmp" "$file"
done