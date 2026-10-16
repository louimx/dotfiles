#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A LINKS=(
    [".bashrc"]="$HOME/.bashrc"
    [".profile"]="$HOME/.profile"
    [".bash_profile"]="$HOME/.bash_profile"
    [".tmux.conf"]="$HOME/.tmux.conf"
    [".gitconfig"]="$HOME/.gitconfig"
    ["patchbox"]="$HOME/.local/bin/patchbox"
    ["configs/nvim"]="$HOME/.config/nvim"
    ["configs/i3"]="$HOME/.config/i3"
    ["configs/polybar"]="$HOME/.config/polybar"
    ["configs/alacritty"]="$HOME/.config/alacritty"
    ["configs/claude/CLAUDE.md"]="$HOME/.claude/CLAUDE.md"
    ["configs/claude/settings.json"]="$HOME/.claude/settings.json"
)

mkdir -p "$HOME/.config" "$HOME/.local/bin"

link() {
    local target="$1" link="$2"
    mkdir -p "$(dirname "$link")"
    if [[ -d "$link" && ! -L "$link" ]]; then
        echo "Skipping $link: real directory, remove it and rerun to link"
        return
    fi
    if [[ -f "$link" && ! -L "$link" ]]; then
        mv "$link" "$link.bak"
        echo "Backed up $link -> $link.bak"
    fi
    ln -sfn "$target" "$link"
    echo "Linked $link -> $target"
}

for source in "${!LINKS[@]}"; do
    link "$DOTFILES_DIR/$source" "${LINKS[$source]}"
done

# Apps: allt i apps/ (AppImages, binärer) görs körbart och länkas till
# ~/.local/bin med filnamnet minus .AppImage. Filerna är gitignorerade.
for app in "$DOTFILES_DIR"/apps/*; do
    [[ -f "$app" ]] || continue
    chmod +x "$app"
    name="$(basename "$app")"
    name="${name%.AppImage}"
    name="${name%.appimage}"
    link "$app" "$HOME/.local/bin/$name"
done

# Rensa länkar i ~/.local/bin som pekar in i apps/ men vars fil är borttagen.
for l in "$HOME/.local/bin"/*; do
    [[ -L "$l" && ! -e "$l" ]] || continue
    [[ "$(readlink "$l")" == "$DOTFILES_DIR/apps/"* ]] || continue
    rm "$l"
    echo "Removed stale link $l"
done

# dmenu cachar programlistan och märker inte alltid nya länkar i ~/.local/bin.
rm -f "$HOME/.cache/dmenu_run"

# Paket som configs och i3 förutsätter. nvim hämtas separat (se readme).
PACKAGES=(
    # Fönsterhanterare och skrivbord
    xinit
    xorg
    i3
    i3status
    i3lock
    xss-lock
    dmenu
    polybar
    alacritty
    tmux
    network-manager-gnome   # nm-applet
    pipewire-pulse          # ljudserver, saknas på Ubuntu Server
    wireplumber
    pulseaudio-utils        # pactl, volymknappar och polybar
    pavucontrol
    brightnessctl
    x11-xserver-utils       # xset, xrandr, setxkbmap
    xinput

    # nvim: lazy.nvim, mason, treesitter, telescope
    git
    curl
    unzip
    build-essential
    xclip
    ripgrep
    python3-venv

    # Granska AI-ändringar: läsbara diffar och hunk-för-hunk i terminalen
    git-delta
    lazygit
)
sudo apt install -y "${PACKAGES[@]}"

echo "Done!"
