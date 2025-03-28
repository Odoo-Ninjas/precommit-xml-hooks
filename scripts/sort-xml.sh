#!/bin/bash
set -e

for file in "$@"; do
  tmp=$(mktemp)
  xsltproc sort-attrs.xslt "$file" | xmlstarlet fo > "$tmp"
  mv "$tmp" "$file"
done