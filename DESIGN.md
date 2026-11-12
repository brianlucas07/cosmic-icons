# Design Guidelines & Visual Philosophy (COSMIC Brian Theme)

This document establishes the visual, structural, and technical principles of the **COSMIC Brian Theme**.

---

## 1. Overview: Modern Iconic Forms with a Cosmic Soul

The theme's visual identity unites the **semantic clarity of classic objects** (the folder, the notepad with a pencil, the terminal window, the software package box) with the modern, polished finish of **COSMIC Desktop**.

- **Real, Recognizable Objects**: Every icon is a direct, organic representation of what the application or section does—without generic "boxes with screens" or artificial clutter.
- **Retro-Futuristic Soul**: Expressed through the **cosmic palette** (deep space blue, vibrant electric cyan, dark titanium, and solar amber accents), soft layered depth shadows, and **generously rounded corners** (*squircles*).
- **Clarity & Function**: Visual noise is eliminated in favor of clean, legible silhouettes across the dock, top panel, app launcher, and system settings.

---

## 2. Geometry & Proportion Principles

1. **Gentle Squircles**:
   - Primary containers adopt smooth, continuous curves (`rx="28"` on the `256x256` canvas).
   - Inner elements (document sheets, windows, panels) use harmonic radii between `rx="14"` and `rx="20"`.
   - The corner curvature aligns seamlessly with COSMIC windows, applets, and floating dock.
2. **Layered Depth**:
   - Natural directional gradients.
   - Soft, diffused drop shadows (`feDropShadow dx="0" dy="6" stdDeviation="7" flood-opacity="0.24"`), creating optical volume without heavy skeuomorphism.
   - Continuous top specular highlight (`stroke="#ffffff" stroke-width="2.5" opacity="0.45"`) along the top edge for tactile definition.

---

## 3. Color Palette & Lighting

| Tone | Hex | Usage |
| :--- | :--- | :--- |
| **Deep Space Blue** | `#075985` → `#0284c7` | Base plates, window frames, and backplates |
| **Vibrant Cosmic Cyan** | `#0284c7` → `#38bdf8` | Front folder flaps, highlights, active controls |
| **Lunar White / Paper** | `#ffffff` → `#f8fafc` | Inner document sheets and high-contrast glyphs |
| **Dark Space Titanium** | `#1e293b` → `#0f172a` | Terminal/system chassis and dark recesses |
| **Solar Amber** | `#fbbf24` / `#f59e0b` | Pencil erasers, telemetry peaks, and focal accents |

---

## 4. Core Application Family

- 📂 **File Manager (`COSMIC Files`)**: Classic folder with curved back tab, squircle front body (`rx="28"`), inner document sheet, and top specular highlight.
- 📝 **Text Editor (`COSMIC Edit`)**: Rounded notepad with soft text lines and a stylized angled pencil casting a soft shadow.
- 💻 **Terminal (`COSMIC Term`)**: Floating squircle window with dark titanium chassis, integrated header bar, and neon cyan `❯ _` prompt.
- 🛍️ **App Store (`COSMIC Store`)**: Rounded software package box (`rx="28"`), colorful app cards (teal, cosmic purple, solar amber) emerging from the top, and central installation arrow.
- ⚙️ **Settings (`COSMIC Settings`)**: Space-titanium squircle chassis (`rx="28"`) with top specular rim, machined recess, precision mechanical gear, and COSMIC toggle switch at the core.
- 🎬 **Media Player (`COSMIC Media Player`)**: Deep cosmic blue squircle chassis (`rx="28"`), midnight-blue inner display, electric cyan central play disc, and bottom progress scrubber.
- 📈 **System Monitor (`COSMIC System Monitor`)**: Dark titanium squircle chassis (`rx="28"`), translucent cyan technical grid, and electric cyan telemetry wave (`#38bdf8`) with a solar amber peak (`#fbbf24`).
- 🖼️ **Image Viewer (`COSMIC Viewer`)**: Vibrant cyan and cosmic blue squircle frame (`rx="28"`) housing a starry deep-space sky, ringed planet, and layered mountain ridges.

---

## 5. Symbolic Icons (`16x16 -symbolic.svg`)

1. **Pixel-Perfect & Crisp**:
   - Designed on a `16x16` grid (`viewBox="0 0 16 16"`).
   - Pure filled vector paths (`fill="#232323"`) with rounded caps and squircle corners (`rx="2.4"` to `3.2`) for full compatibility with `libcosmic` dynamic recoloring in Dark and Light modes.
2. **Semantic Hierarchy**:
   - Primary strokes and silhouettes at full opacity (`1.0`), with secondary layers or inactive states at `0.3`–`0.55` opacity.

---

## 6. Local Installation & Testing Workflow

```bash
# 1. Install the theme into ~/.local/share/icons/COSMIC-Brian-Theme
./install.sh

# 2. Reload COSMIC dock, app library, and launcher
killall cosmic-app-list cosmic-app-library cosmic-launcher
```
