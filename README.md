# Dotfiles

A minimal development environment.

## Setup

The following assumes Homebrew is installed, the destination paths do not already exist, and the configuration lives in `~/Developer/dotfiles`.

```sh
mkdir -p "$HOME/.config"

ln -s "$HOME/Developer/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/Developer/dotfiles/zsh/.zprofile" "$HOME/.zprofile"
ln -s "$HOME/Developer/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
```
