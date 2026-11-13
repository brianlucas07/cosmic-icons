#!/usr/bin/env bash
set -e

THEME_DIR="${THEME_DIR:-$HOME/.local/share/icons/COSMIC-Brian-Theme}"
STATE_FILE="$THEME_DIR/.last-accent"
STOP1="#38bdf8"
STOP2="#0284c7"

resolve_cosmic_accent() {
    local mode="Dark"
    local mode_file="$HOME/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark"
    if [ -f "$mode_file" ] && grep -q "false" "$mode_file"; then
        mode="Light"
    fi
    local accent_file="$HOME/.config/cosmic/com.system76.CosmicTheme.${mode}/v2/accent"
    [ -f "$accent_file" ] || return 1

    local base hover
    base=$(sed -n 's/.*base: *"\(#[0-9A-Fa-f]\{6\}\).*/\1/p' "$accent_file" | head -n 1)
    hover=$(sed -n 's/.*pressed: *"\(#[0-9A-Fa-f]\{6\}\).*/\1/p' "$accent_file" | head -n 1)
    [ -n "$base" ] && [ -n "$hover" ] || return 1
    STOP1="$base"
    STOP2="$hover"
}

resolve_gnome_accent() {
    command -v gsettings &>/dev/null || return 1
    local color
    color=$(gsettings get org.gnome.desktop.interface accent-color 2>/dev/null | tr -d "'")
    case "$color" in
        blue)   STOP1="#38bdf8"; STOP2="#0284c7" ;;
        teal)   STOP1="#2dd4bf"; STOP2="#0d9488" ;;
        green)  STOP1="#4ade80"; STOP2="#16a34a" ;;
        yellow) STOP1="#facc15"; STOP2="#ca8a04" ;;
        orange) STOP1="#fb923c"; STOP2="#ea580c" ;;
        red)    STOP1="#f87171"; STOP2="#dc2626" ;;
        pink)   STOP1="#f472b6"; STOP2="#db2777" ;;
        purple) STOP1="#c084fc"; STOP2="#7e22ce" ;;
        slate)  STOP1="#94a3b8"; STOP2="#475569" ;;
        *)      return 1 ;;
    esac
}

detect_accent_colors() {
    if [[ "${XDG_CURRENT_DESKTOP:-}" == *"COSMIC"* ]]; then
        resolve_cosmic_accent || resolve_gnome_accent || true
    elif [[ "${XDG_CURRENT_DESKTOP:-}" == *"GNOME"* ]]; then
        resolve_gnome_accent || resolve_cosmic_accent || true
    else
        resolve_cosmic_accent || resolve_gnome_accent || true
    fi
}

update_svg_back_folder() {
    local file="$1"
    [ -f "$file" ] || return 0
    sed -i '/id="back-folder"/,/<\/linearGradient>/{
        s/offset="0%" stop-color="#[0-9A-Fa-f]\{6\}"/offset="0%" stop-color="'"$STOP1"'"/
        s/offset="100%" stop-color="#[0-9A-Fa-f]\{6\}"/offset="100%" stop-color="'"$STOP2"'"/
    }' "$file"
}

apply_folder_accent() {
    [ -d "$THEME_DIR/scalable" ] || exit 0
    detect_accent_colors

    local current_pair="${STOP1}:${STOP2}"
    if [ "${1:-}" != "--force" ] && [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "$current_pair" ]; then
        exit 0
    fi

    for svg in "$THEME_DIR"/scalable/places/*.svg \
               "$THEME_DIR/scalable/mimetypes/inode-directory.svg" \
               "$THEME_DIR/scalable/status/folder-open.svg" \
               "$THEME_DIR/scalable/status/folder-drag-accept.svg"; do
        update_svg_back_folder "$svg"
    done

    printf "%s" "$current_pair" > "$STATE_FILE"
    gtk-update-icon-cache -f -t "$THEME_DIR" 2>/dev/null || true
    if [ "${1:-}" != "--no-reload" ] && pgrep -x cosmic-files >/dev/null 2>&1; then
        killall cosmic-files 2>/dev/null || true
    fi
}

apply_folder_accent "${1:-}"
