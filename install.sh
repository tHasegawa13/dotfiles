#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1"
    local dst="$2"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "already linked: $dst"
        return
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        local backup="${dst}.bak.$(date +%Y%m%d%H%M%S)"
        mv "$dst" "$backup"
        echo "backed up: $dst -> $backup"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "linked: $dst -> $src"
}

link "$DOTFILES_DIR/.zshrc"               "$HOME/.zshrc"
link "$DOTFILES_DIR/.config/fish"         "$HOME/.config/fish"
link "$DOTFILES_DIR/.config/nvim"         "$HOME/.config/nvim"
link "$DOTFILES_DIR/.config/git"          "$HOME/.config/git"
link "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
