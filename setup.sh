#!/bin/bash

# Base backup directory
BASE_BACKUP_DIR="$HOME/.config_backup"

# Determine backup directory
if [ -d "$BASE_BACKUP_DIR" ]; then
  # Generate unique 8-digit random number
  RANDOM_ID=$(tr -dc '0-9' </dev/urandom | head -c 8)
  BACKUP_DIR="${BASE_BACKUP_DIR}_$RANDOM_ID"

  # Create the backup directory
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created at: $BACKUP_DIR"

  # Save the random number to a hidden file
  RAND_FILE="$HOME/.config_backup_rand_num"
  echo "$RANDOM_ID" > "$RAND_FILE"
  echo "Saved random ID to $RAND_FILE"
else
  BACKUP_DIR="$BASE_BACKUP_DIR"

  # Create the base backup directory
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created at: $BACKUP_DIR"
fi

# Loop through all files in the current directory
for file in *; do
  # Skip README.md (case-insensitive)
  if [[ "${file,,}" == "readme.md" ]]; then
    echo "Skipping README.md"
    continue
  fi

  DOTFILE="$HOME/.$file"

  # Move existing dotfile from $HOME to backup
  if [ -e "$DOTFILE" ]; then
    mv "$DOTFILE" "$BACKUP_DIR/"
    echo "Moved existing file: $DOTFILE -> $BACKUP_DIR/"
  fi

  # Copy file from current directory to $HOME with dot prefix
  cp "$file" "$DOTFILE"
  echo "Copied: $file -> $DOTFILE"
done

echo "All files processed."

