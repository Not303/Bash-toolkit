#!/bin/bash

# Junk File Cleaner Script
# Author: Abhiyander
# Version: 1.0

TARGET_DIR="$1"

# Check if folder is given
if [ -z "$TARGET_DIR" ]; then
  echo "Usage: $0 <target_directory>"
  exit 1
fi


# validating directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: '$TARGET_DIR' is not a valid directory."
  exit 1
fi


echo "Scanning for junk files in: $TARGET_DIR"


# Junk files
JUNK_FILES=$(find "$TARGET_DIR" -type f \( -name "*.tmp" -o -name "*.bak" -o -name ".DS_Store" -o -name "Thumbs.db" \))



if [ -z "$JUNK_FILES" ]; then
  echo "No junk files found."
  exit 0
fi

echo "The following junk files were found:"
echo "$JUNK_FILES"
echo

read -p "Do you want to delete them? (y/n): " confirm

if [ "$confirm" == "y" ]; then
  echo "$JUNK_FILES" | xargs rm -f
  echo "Junk files destroyed."
else
  echo "Cleanup canceled."
fi

# -end-