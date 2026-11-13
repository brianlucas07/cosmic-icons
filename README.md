# COSMIC Brian Theme

**Brian's Redesign of System76's COSMIC Icon Theme for Linux.**

A modern retro-futuristic squircle icon theme (`256×256` full-color apps/places and `16×16 -symbolic` icons) designed for **COSMIC Desktop**, **GNOME**, and any Freedesktop-compatible Linux desktop environment. It preserves the recognizable visual identity of COSMIC's default icons while elevating them with tactile depth, continuous top specular highlights, soft layered shadows, and a cohesive cosmic blue, electric cyan, dark titanium, and solar amber palette.

---

## Third-Party Applications Design System Specification

For third-party software (such as developer tools, IDEs, browsers, and media suites), the theme enforces a strict **Native-First with Cosmic Detailing** standard.

### 1. The Golden Rule: Never Cage Brand Silhouettes
- **Full-Scale Presence:** Third-party applications must **never** be shrunken down into generic dark-gray/neutral tiles or uniform square containers. The application's native geometry, official silhouette, and trademark facets occupy the primary `256×256` canvas directly.
- **Strict Brand Fidelity:** Official brand colors, corporate gradients, and proprietary logotype typography (e.g., JetBrains official "WS", "RD", "RR" lettering, Android Studio blueprint geometry, Firefox flame arcs) must be preserved with exact vector fidelity to ensure zero friction and preserve user muscle memory.

### 2. The 4 Cosmic & Retro-Futuristic Detailing Layers
Cosmic integration is achieved through high-precision finishing details rather than altering the core brand shape:
1. **Continuous Top Specular Curvature Highlight:** A smooth curved or horizontal stroke along the upper contour (`stroke="#ffffff"` with `stroke-width="2.5"` to `3` and `opacity="0.45"` to `0.55"`), simulating the reflective curvature of optical aerospace glass.
2. **Aerospace Micro-Borders & Bevels:** Subtle, crisp outer perimeter strokes (`stroke="#ffffff"` with `stroke-width="1"` to `1.2"` and `stroke-opacity="0.25"`) and light bevels on vertex meeting edges that give tactile presence.
3. **Layered Ambient Depth & Brand Glow:** Dual-stage drop shadows using SVG `<feDropShadow>`: a deep occlusion shadow (`flood-color="#050811"` with high deviation) layered with a soft ambient neon glow tinted in the application's primary brand color.
4. **Technical & Blueprint Precision Accents:** Subtle scientific accents where applicable—such as concentric measurement rings, hairline grid lines, and glowing terminal/antenna beacons.

### 3. Symbolic Icon Standard (`-symbolic`)
- Each third-party icon is accompanied by a companion `-symbolic.svg` in `16×16` (`viewBox="0 0 16 16"`).
- Uses simplified, high-contrast monochrome silhouettes with `fill="currentColor"` for dynamic dark/light panel adaptation.

### 4. XDG Resolution & Dynamic Toolbox Integration
- Native icons are registered under both standard Freedesktop names and full reverse-DNS App IDs (`<app>.svg` and `org.<vendor>.<app>.svg`).
- The `./install.sh` script automatically detects dynamically generated desktop launchers (such as JetBrains Toolbox UUID entries in `~/.local/share/applications/`) and generates symlinks, ensuring instant theme coverage regardless of how the user installs the application.

---

## Quick Install (One-Command Setup)

Run the following single command in your terminal:

```bash
rm -rf /tmp/cosmic-brian-theme && git clone https://github.com/brianlucas07/cosmic-icons.git /tmp/cosmic-brian-theme && /tmp/cosmic-brian-theme/install.sh && rm -rf /tmp/cosmic-brian-theme
```

> **Note:** `./install.sh` automatically activates `COSMIC-Brian-Theme` via `gsettings` (for **GNOME / GTK** desktops) and, on **COSMIC Desktop**, sets `COSMIC-Brian-Theme` as your active icon theme and briefly restarts `cosmic-panel` (top panel and dock), `cosmic-app-library`, `cosmic-launcher`, `cosmic-files`, `cosmic-files-applet` (desktop icons), and `cosmic-app-list` so the in-memory SVG icon cache refreshes immediately without needing to log out.

This command will:
1. Clone the repository into a temporary directory (`/tmp/cosmic-brian-theme`);
2. Build and install the icon theme cleanly into `~/.local/share/icons/COSMIC-Brian-Theme` (without requiring `sudo` or overwriting system icons);
3. Update the icon cache (`gtk-update-icon-cache`);
4. Activate `COSMIC-Brian-Theme` on **GNOME / GTK** (`gsettings`) and **COSMIC Desktop** (reloading the panel, dock, launcher, and desktop caches);
5. Remove the temporary build directory.

---

## Multi-Desktop Fallback Chain

In `index.theme`, the inheritance chain is configured as:

```ini
Inherits=Cosmic,Pop,Papirus,Adwaita,hicolor
```

This ensures full compatibility even on distributions that do not have the base `Cosmic` icon package installed (such as pure GNOME on Fedora, Ubuntu, Debian, or Arch), gracefully falling back to `Papirus` or `Adwaita`.

---

## Switching Themes Manually

- **COSMIC Desktop (GUI):** Open **Settings > Desktop > Appearance**, scroll down to the **Icon theme** section, and select **COSMIC Brian Theme**. *(If switching from another theme while the session is running, run `killall cosmic-panel cosmic-app-library cosmic-launcher cosmic-files-applet cosmic-app-list` to refresh the in-memory icon cache immediately).*
- **COSMIC Desktop (Terminal):**
  ```bash
  echo -n '"COSMIC-Brian-Theme"' > ~/.config/cosmic/com.system76.CosmicTk/v1/icon_theme
  killall cosmic-panel cosmic-app-library cosmic-launcher cosmic-files-applet cosmic-app-list
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
