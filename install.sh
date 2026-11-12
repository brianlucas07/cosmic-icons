#!/usr/bin/env bash
set -e

if ! command -v just &> /dev/null; then
    echo "Error: 'just' is required to build and install the icon theme."
    exit 1
fi

echo "Installing COSMIC Brian Theme to ~/.local/share/icons/COSMIC-Brian-Theme..."
just prefix="$HOME/.local" install
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/COSMIC-Brian-Theme" 2>/dev/null || true

if command -v gsettings &> /dev/null; then
    echo "Setting GTK/GNOME icon theme to 'COSMIC-Brian-Theme'..."
    gsettings set org.gnome.desktop.interface icon-theme 'COSMIC-Brian-Theme' 2>/dev/null || true
fi

COSMIC_TK_DIR="$HOME/.config/cosmic/com.system76.CosmicTk/v1"
if [ -d "$HOME/.config/cosmic" ]; then
    echo "Activating 'COSMIC-Brian-Theme' on COSMIC and reloading panel, dock, and launcher caches..."
    mkdir -p "$COSMIC_TK_DIR"
    printf '"COSMIC-Brian-Theme"' > "$COSMIC_TK_DIR/icon_theme"
    killall cosmic-panel cosmic-app-library cosmic-launcher cosmic-files 2>/dev/null || true
fi

echo "Installation complete! 'COSMIC Brian Theme' is now installed and active."
