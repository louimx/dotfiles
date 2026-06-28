#!/usr/bin/env bash

set -euo pipefail

# Directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FILES=(
    ".bashrc"
    ".profile"
    ".bash_profile"
)

for file in "${FILES[@]}"; do
    target="$DOTFILES_DIR/$file"
    link="$HOME/$file"

    if [[ ! -e "$target" ]]; then
        echo "Skipping $file (not found)"
        continue
    fi

    ln -sfn "$target" "$link"
    echo "Linked $link -> $target"
done


PATH_LINE="export PATH=\"$DOTFILES_DIR/scripts:\$PATH\""

if ! grep -Fxq "$PATH_LINE" "$DOTFILES_DIR/.bashrc"; then
    echo "" >> "$DOTFILES_DIR/.bashrc"
    echo "# Dotfiles scripts" >> "$DOTFILES_DIR/.bashrc"
    echo "$PATH_LINE" >> "$DOTFILES_DIR/.bashrc"
fi

echo "Done!"
