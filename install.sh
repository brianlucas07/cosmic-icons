#!/usr/bin/env bash
set -e

if ! command -v just &> /dev/null; then
    echo "Error: 'just' is required to build and install the icon theme."
    exit 1
fi

just prefix="$HOME/.local" install
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/COSMIC-Brian-Theme" 2>/dev/null || true

echo "Installation complete! Select 'COSMIC Brian Theme' in Settings > Desktop > Appearance."
