#!/bin/bash
set -euo pipefail

read -p "Enter directory to sort: " dirname
cd "$dirname" || { echo "Directory not found."; exit 1; }

for file in *.*; do
  [ -f "$file" ] || continue
  ext="${file##*.}"
  mkdir -p "$ext"
  mv "$file" "$ext/"
done

echo "All files sorted into folders by extension!"
