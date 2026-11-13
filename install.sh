#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$HOME/.local/share/icons/COSMIC-Brian-Theme"

install_accent_watcher() {
    command -v systemctl &>/dev/null || return 0
    local unit_dir="$HOME/.config/systemd/user"
    mkdir -p "$unit_dir"

    cat > "$unit_dir/cosmic-brian-accent.service" <<EOF
[Unit]
Description=Sync COSMIC Brian Theme folder tab accent color

[Service]
Type=oneshot
ExecStart=$THEME_DIR/sync-accent.sh
EOF

    cat > "$unit_dir/cosmic-brian-accent.path" <<EOF
[Unit]
Description=Watch desktop accent color changes for COSMIC Brian Theme

[Path]
PathChanged=%h/.config/cosmic/com.system76.CosmicTheme.Dark/v2/accent
PathChanged=%h/.config/cosmic/com.system76.CosmicTheme.Light/v2/accent
PathChanged=%h/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark
PathChanged=%h/.config/dconf/user

[Install]
WantedBy=default.target
EOF

    systemctl --user daemon-reload 2>/dev/null || true
    systemctl --user enable --now cosmic-brian-accent.path 2>/dev/null || true
}

echo "Installing COSMIC Brian Theme to $THEME_DIR..."
rm -rf "$THEME_DIR"
mkdir -p "$THEME_DIR"
cp -r "$SCRIPT_DIR/freedesktop/scalable" "$THEME_DIR/"
cp -r "$SCRIPT_DIR/extra/scalable" "$THEME_DIR/"
install -Dm0644 "$SCRIPT_DIR/index.theme" "$THEME_DIR/index.theme"
install -Dm0755 "$SCRIPT_DIR/sync-accent.sh" "$THEME_DIR/sync-accent.sh"
"$THEME_DIR/sync-accent.sh" --no-reload
install_accent_watcher
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
