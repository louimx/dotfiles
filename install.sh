#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A LINKS=(
    [".bashrc"]="$HOME/.bashrc"
    [".profile"]="$HOME/.profile"
    [".bash_profile"]="$HOME/.bash_profile"
    ["configs/nvim"]="$HOME/.config/nvim"
)

mkdir -p "$HOME/.config"

for source in "${!LINKS[@]}"; do
    target="$DOTFILES_DIR/$source"
    link="${LINKS[$source]}"

    rm -rf "$link"
    ln -s "$target" "$link"

    echo "Linked $link -> $target"
done


PATH_LINE="export PATH=\"$DOTFILES_DIR/scripts:\$PATH\""

if ! grep -Fxq "$PATH_LINE" "$DOTFILES_DIR/.bashrc"; then
    echo "" >> "$DOTFILES_DIR/.bashrc"
    echo "# Dotfiles scripts" >> "$DOTFILES_DIR/.bashrc"
    echo "$PATH_LINE" >> "$DOTFILES_DIR/.bashrc"
fi

echo "Done!"
