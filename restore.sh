#!/bin/bash

# File that stores the random ID (if any)
RAND_FILE="$HOME/.config_backup_rand_num"
BASE_BACKUP_DIR="$HOME/config_backup"
BACKUP_DIR=""

# Determine backup directory
if [ -f "$RAND_FILE" ]; then
  RANDOM_ID=$(cat "$RAND_FILE")
  BACKUP_DIR="${BASE_BACKUP_DIR}_$RANDOM_ID"
  echo "Restoring from: $BACKUP_DIR (random ID: $RANDOM_ID)"
else
  BACKUP_DIR="$BASE_BACKUP_DIR"
  echo "Restoring from: $BACKUP_DIR"
fi

# Check if backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Error: Backup directory $BACKUP_DIR does not exist."
  exit 1
fi

# Loop through all files in current directory
for file in *; do
  # Skip README.md (case-insensitive)
  if [[ "${file,,}" == "readme.md" ]]; then
    continue
  fi

  DOTFILE="$HOME/.$file"

  # Delete the dotfile from $HOME
  if [ -e "$DOTFILE" ]; then
    rm "$DOTFILE"
    echo "Deleted: $DOTFILE"
  fi

  # Restore from backup
  if [ -e "$BACKUP_DIR/.$file" ]; then
    mv "$BACKUP_DIR/.$file" "$DOTFILE"
    echo "Restored: $BACKUP_DIR/.$file -> $DOTFILE"
  fi
done

# Remove backup directory
rm -rf "$BACKUP_DIR"
echo "Removed backup directory: $BACKUP_DIR"

# Remove the random ID file if it exists
if [ -f "$RAND_FILE" ]; then
  rm "$RAND_FILE"
  echo "Removed random ID file: $RAND_FILE"
fi

echo "Restore completed."

