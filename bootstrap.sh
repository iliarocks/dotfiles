#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if ! command -v brew &>/dev/null; then
  echo "please install homebrew first"
  echo "run /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
fi

link() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ]; then
    echo "$target exists, skipping"
  else
    ln -s "$source" "$target"
    echo "linked $target"
  fi
}

echo "Linking dotfiles..."

for dir in "$DOTFILES"/config/*; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  link "$dir" "$CONFIG_HOME/$name"
done

shopt -s dotglob

for item in "$DOTFILES"/home/*; do
  [ -e "$item" ] || continue
  name=$(basename "$item")
  link "$item" "$HOME/$name"
done

shopt -u dotglob

echo "Linking done"

echo "Installing developer tools..."

tools=(
  node
  bun
  ripgrep
  clojure
)

for tool in "${tools[@]}"; do
  if brew list "$tool" &>/dev/null; then
    echo "Skipping $tool"
  else
    echo "Installing $tool..."
    brew install "$tool"
  fi
done

echo "Bootstrap complete"








