# COSMIC Brian Theme

**Brian's Redesign of System76's COSMIC Icon Theme for Linux.**

A modern retro-futuristic squircle icon theme (`256×256` full-color apps/places and `16×16 -symbolic` icons) designed for **COSMIC Desktop** and any Freedesktop-compatible Linux desktop environment. It preserves the recognizable visual identity of COSMIC's default icons while elevating them with tactile depth, continuous top specular highlights, soft layered shadows, and a cohesive cosmic blue, electric cyan, dark titanium, and solar amber palette.

---

## Quick Install (One-Command Setup)

Make sure `just` is installed on your distribution (`sudo pacman -S just`, `sudo apt install just`, or `sudo dnf install just`).

Then run the following single command in your terminal:

```bash
git clone https://github.com/brianlucas07/cosmic-icons.git /tmp/cosmic-brian-theme && cd /tmp/cosmic-brian-theme && ./install.sh && rm -rf /tmp/cosmic-brian-theme
```

This command will:
1. Clone the repository into a temporary directory (`/tmp/cosmic-brian-theme`);
2. Build and install the icon theme cleanly into `~/.local/share/icons/COSMIC-Brian-Theme` (without requiring `sudo` or overwriting system icons);
3. Update the icon cache (`gtk-update-icon-cache`);
4. Remove the temporary build directory.

---

## Activating the Theme

- **COSMIC Desktop (GUI):** Open **Settings > Desktop > Appearance**, scroll down to the **Icon theme** section, and select **COSMIC Brian Theme**.
- **COSMIC Desktop (Terminal):**
  ```bash
  echo -n '"COSMIC-Brian-Theme"' > ~/.config/cosmic/com.system76.CosmicTk/v1/icon_theme
  ```
- **GNOME / GTK:**
  ```bash
  gsettings set org.gnome.desktop.interface icon-theme 'COSMIC-Brian-Theme'
  ```

---

## Manual Installation (Development)

```bash
git clone https://github.com/brianlucas07/cosmic-icons.git
cd cosmic-icons
./install.sh
```

To uninstall from your local user directory:

```bash
just uninstall-user
```

---

## Copying or Reusing

This project has mixed licencing. You are free to copy, redistribute and/or modify aspects of this work under the terms of each licence accordingly (unless otherwise specified).

The icon assets (any and all source `.svg` files or rendered `.png` files) are licenced under the terms of the [Creative Commons Attribution-ShareAlike 4.0 License](https://creativecommons.org/licenses/by-sa/4.0/).

Included scripts are free software licenced under the terms of the [GNU General Public License, version 3](https://www.gnu.org/licenses/gpl-3.0.txt).

When reusing this work please include a proper attribution:

> "[Cosmic Icons](http://github.com/pop-os/cosmic-icons)" by [System76](http://system76.com/) is licensed under [CC-SA-4.0](http://creativecommons.org/licenses/by-sa/4.0/)
