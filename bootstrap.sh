#!/usr/bin/env bash
set -e

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DOTFILES="$HOME/.dotfiles"

mkdir -p "$CONFIG_HOME" "$DOTFILES/config" "$DOTFILES/home"

# Link config directories
for dir in "$DOTFILES/config"/*; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  target="$CONFIG_HOME/$name"
  [ -e "$target" ] && echo "Skipping $target" || { echo "Linking $target"; ln -s "$dir" "$target"; }
done

# Link home files
echo "Processing home files..."
for file in "$DOTFILES/home"/* "$DOTFILES/home"/.*; do
  echo "Checking: $file"
  [ -e "$file" ] || continue
  name=$(basename "$file")
  # Skip . and .. directories
  [ "$name" = "." ] || [ "$name" = ".." ] && continue
  target="$HOME/$name"
  echo "Would link: $target -> $file"
  [ -e "$target" ] && echo "Skipping $target" || { echo "Linking $target"; ln -s "$file" "$target"; }
done

echo "Done"
