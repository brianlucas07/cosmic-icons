#!/usr/bin/env bash
set -e

THEME_DIR="$HOME/.local/share/icons/COSMIC-Brian-Theme"

echo "Installing COSMIC Brian Theme to $THEME_DIR..."
mkdir -p "$THEME_DIR"
cp -r ./freedesktop/scalable "$THEME_DIR/"
cp -r ./extra/scalable "$THEME_DIR/"
install -Dm0644 ./index.theme "$THEME_DIR/index.theme"
gtk-update-icon-cache -f -t "$THEME_DIR" 2>/dev/null || true

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
