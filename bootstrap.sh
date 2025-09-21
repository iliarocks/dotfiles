#!/usr/bin/env bash

set -ex

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DOTFILES="$HOME/.dotfiles"

mkdir -p "$CONFIG_HOME"
mkdir -p "$DOTFILES/config"
mkdir -p "$DOTFILES/home"

for dir in ~/.dotfiles/config/*; do
  name=$(basename "$dir")
  target="$HOME/.config/$name"

   if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Skipping $target (already exists)"
  else
    echo "Linking $target -> $dir"
    ln -s "$dir" "$target"              
   fi
done


for file in "$HOME/.dotfiles/home/"*; do
  name=$(basename "$file")
  target="$HOME/$name"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Skipping $target (already exists)"
  else
    echo "Linking $target -> $file"
    ln -s "$file" "$target"
  fi
done

echo "Do setting up dotfiles"
