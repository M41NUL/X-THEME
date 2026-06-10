<div align="center">

```
  ██╗  ██╗      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
  ╚██╗██╔╝      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
   ╚███╔╝  █████╗  ██║   ███████║█████╗  ██╔████╔██║█████╗
   ██╔██╗  ╚════╝  ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
  ██╔╝ ██╗         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
  ╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
```

### Termux Customizer — Theme · Font · Banner · Prompt · Keys

[![Version](https://img.shields.io/badge/version-1.0.0-00ff41?style=for-the-badge&logo=github)](https://github.com/M41NUL/X-THEME)
[![Platform](https://img.shields.io/badge/platform-Termux%20%7C%20Android-orange?style=for-the-badge&logo=android)](https://github.com/M41NUL/X-THEME)
[![Language](https://img.shields.io/badge/language-Shell_Script-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](https://github.com/M41NUL/X-THEME)
[![License](https://img.shields.io/badge/license-MIT-red?style=for-the-badge)](LICENSE)

[![Stars](https://img.shields.io/github/stars/M41NUL/X-THEME?style=for-the-badge&color=yellow&logo=star)](https://github.com/M41NUL/X-THEME/stargazers)
[![Forks](https://img.shields.io/github/forks/M41NUL/X-THEME?style=for-the-badge&color=blue&logo=git)](https://github.com/M41NUL/X-THEME/network/members)
[![Issues](https://img.shields.io/github/issues/M41NUL/X-THEME?style=for-the-badge&color=red)](https://github.com/M41NUL/X-THEME/issues)
[![Last Commit](https://img.shields.io/github/last-commit/M41NUL/X-THEME?style=for-the-badge&color=brightgreen)](https://github.com/M41NUL/X-THEME/commits/main)

[![Repo Size](https://img.shields.io/github/repo-size/M41NUL/X-THEME?style=flat-square&color=orange)](https://github.com/M41NUL/X-THEME)
[![Code Size](https://img.shields.io/github/languages/code-size/M41NUL/X-THEME?style=flat-square&color=blueviolet)](https://github.com/M41NUL/X-THEME)
[![Top Language](https://img.shields.io/github/languages/top/M41NUL/X-THEME?style=flat-square)](https://github.com/M41NUL/X-THEME)
[![Watchers](https://img.shields.io/github/watchers/M41NUL/X-THEME?style=flat-square&color=brightgreen)](https://github.com/M41NUL/X-THEME/watchers)
[![Contributors](https://img.shields.io/github/contributors/M41NUL/X-THEME?style=flat-square&color=orange)](https://github.com/M41NUL/X-THEME/graphs/contributors)

[![Telegram Channel](https://img.shields.io/badge/Telegram-Channel-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/codexm41nul)
[![Telegram Group](https://img.shields.io/badge/Telegram-Group-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/codex_m41nul)
[![YouTube](https://img.shields.io/badge/YouTube-Channel-FF0000?style=for-the-badge&logo=youtube)](https://youtube.com/@codexm41nul)
[![Author](https://img.shields.io/badge/dev-CODEX--M41NUL-ff8c00?style=for-the-badge&logo=github)](https://github.com/M41NUL)

</div>

---

## What is X-THEME?

**X-THEME** is a full Termux customization tool written in pure Shell Script. Change your terminal color theme, font, startup banner, prompt style, and extra keyboard layout — all from one interactive menu. Supports both bash and zsh. Includes backup and restore.

> Make your Termux look exactly the way you want.

---

## Features

| Feature | Details |
|---------|---------|
| 🎨 Color Themes | 55+ themes — Hacker, Cyberpunk, Dracula, Nord, Tokyo Night & more |
| 🔤 Fonts | 50+ fonts — JetBrains Mono, Fira Code, VT323, Press Start 2P & more |
| 📟 MOTD Banners | 58+ banners in 7 categories — Hacker, Matrix, Retro, Minimal & more |
| ✏️ Prompt Styles | 20+ prompts — H4CK3R Box, Lambda, Powerline, Arrow & more |
| ⌨️ Extra Keys | 12+ keyboard layouts + custom layout builder |
| 💾 Backup/Restore | Save and restore all settings at once |
| 🔄 Auto Update | Auto-checks for updates on every launch |
| 🐚 Shell Support | Works with both bash and zsh |
| 📦 Smart Installer | Skips already installed packages |

---

## Project Structure

```
X-THEME/
├── x-theme.sh          — Main entry point
├── utils.sh            — Colors, helpers, progress bar
├── themes.sh           — Theme loader
├── fonts.sh            — 50+ fonts (downloaded from GitHub)
├── banners.sh          — Banner loader
├── prompts.sh          — 20+ prompt styles
├── extrakeys.sh        — Keyboard layouts
├── backup.sh           — Backup and restore
├── updater.sh          — Auto update checker
├── installer.sh        — Smart installer
├── version.txt         — Version tracking
│
├── themes/             — Theme category files
│   ├── hacker.sh       — Hacker / Cyber themes
│   ├── popular.sh      — Popular dev favorites
│   ├── aesthetic.sh    — Retro / Nature / Aesthetic
│   └── minimal.sh      — Minimal / Clean
│
└── banners/            — Banner category files
    ├── hacker.sh       — Hacker / Cyber banners
    ├── matrix.sh       — Matrix / Cyberpunk
    ├── retro.sh        — Retro / Classic
    ├── minimal.sh      — Minimal / Clean
    ├── nature.sh       — Nature / Space / Art
    ├── brand.sh        — Brand / Personal
    └── fun.sh          — Fun / Anime / Pop Culture
```

---

## Installation

### One-line install

```bash
git clone https://github.com/M41NUL/X-THEME.git && cd X-THEME && bash installer.sh
```

### Step by step

```bash
# Step 1 — Clone
git clone https://github.com/M41NUL/X-THEME.git
cd X-THEME

# Step 2 — Install & launch
bash installer.sh
```

The installer will:
- Update Termux packages
- Install `curl`, `git`, `termux-tools`
- Request Android storage permission (once only)
- Auto-launch X-THEME after install

### Run manually (after first install)

```bash
cd X-THEME
bash x-theme.sh
```

---

## Commands

| Command | Description |
|---------|-------------|
| `git clone https://github.com/M41NUL/X-THEME.git` | Clone the repo |
| `bash installer.sh` | Install and launch |
| `bash x-theme.sh` | Run manually |
| `git pull origin main` | Update manually |
| `rm -rf X-THEME` | Remove project folder |

---

## Uninstall

```bash
rm -rf X-THEME
rm -f ~/.xtheme_current
rm -rf ~/.xtheme_backup
```

---

## Menu

```
[1]  Theme Menu       — 55+ color themes
[2]  Font Menu        — 50+ fonts
[3]  Banner Menu      — 58+ MOTD banners (7 categories)
[4]  Prompt Menu      — 20+ prompt styles
[5]  Extra Keys Menu  — Keyboard row layouts
[6]  Backup/Restore   — Save and restore all settings
[0]  Exit
```

---

## Theme Categories

**Hacker / Cyber**
```
Matrix · H4CK3R · Cyberpunk · Blood · Ghost · Neon · Midnight_Hack
Red_Alert · Toxic · Void · Dark_Web · Terminal_Green · Phosphor · Ice_Blue
```

**Popular / Dev Favorites**
```
Dracula · Nord · Monokai · Gruvbox_Dark · Gruvbox_Light · Solarized_Dark
Tokyo_Night · One_Dark · Catppuccin · Rose_Pine · Kanagawa · Everforest
Tokyodark · Ayu_Dark · OneDark_Pro
```

**Retro / Nature / Aesthetic**
```
Retro_Green · Retro_Amber · C64 · DOS · Synthwave · Outrun · Vaporwave
Forest · Ocean · Sunset · Arctic · Sakura · Coffee · Lavender · Pastel
```

**Minimal / Clean**
```
Pure_Dark · Pure_Light · Paper · Minimal_Blue · Ink · Snow · Linen
Mono_Red · Mono_Blue
```

---

## Banner Categories

| Category | Banners |
|----------|---------|
| Hacker / Cyber | H4CK3R_ASCII, Access_Granted, Terminal_Boot, Root_Shell, Payload_Ready... |
| Matrix / Cyberpunk | Matrix_Rain, Cyberpunk_City, Ghost_Shell, Glitch, Synthwave, Void_System... |
| Retro / Classic | DOS_Boot, C64_Style, ASCII_Dragon, Pixel_Banner, Old_School, Tape_Deck... |
| Minimal / Clean | Minimal_Arrow, Wave, Clean_Box, Gradient_Bar, Dots_Line, One_Liner... |
| Nature / Space | Space_Station, Galaxy, Fire_Flame, Ocean_Wave, Mountain, Sunrise... |
| Brand / Personal | CODEX_M41NUL, MAINUL_X_Brand, Dev_Card, X_Theme_Brand... |
| Fun / Anime | Naruto_Run, One_Piece, Demon_Slayer, Error_404, Coffee_Code, Bug_Hunter... |

---

## Prompt Styles

```
H4CK3R_Box    ┌─[user@termux]-[~]
              └─ >>>

Cyberpunk     [CYBER]~>

Matrix        [matrix@neo ~]$

Lambda        ~/path λ

Arrow_Right   ~/path ❯

Powerline     | user | ~/path | $
```

---

## Extra Key Layouts

| Layout | Keys |
|--------|------|
| Hacker | `/ LS $ ~ EXIT * EX CTRL ALT` arrows |
| Developer | `ESC TAB CTRL ALT { } [ ]` pipe backtick |
| Vim User | `ESC : / w q ! u CTRL` arrows `G g` |
| Python Dev | `TAB : ( ) [ ] # CTRL ALT ' " = DEL` |
| Git Tools | `git add push pull log status diff` |
| Full Keys | `ESC F1–F4 TAB CTRL ALT` all arrows `DEL` |
| Custom | Enter your own layout |

---

## Developer

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-M41NUL-181717?style=for-the-badge&logo=github)](https://github.com/M41NUL)
[![Telegram DM](https://img.shields.io/badge/Telegram-DM-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/mdmainulislaminfo)
[![Channel](https://img.shields.io/badge/Telegram-Channel-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/codexm41nul)
[![YouTube](https://img.shields.io/badge/YouTube-codexm41nul-FF0000?style=for-the-badge&logo=youtube)](https://youtube.com/@codexm41nul)
[![Email](https://img.shields.io/badge/Email-devmainulislam@gmail.com-D14836?style=for-the-badge&logo=gmail)](mailto:devmainulislam@gmail.com)

| Field | Info |
|-------|------|
| **Name** | Md. Mainul Islam |
| **Brand** | CODEX-M41NUL |
| **GitHub** | [github.com/M41NUL](https://github.com/M41NUL) |
| **Telegram DM** | [t.me/mdmainulislaminfo](https://t.me/mdmainulislaminfo) |
| **Channel** | [t.me/codexm41nul](https://t.me/codexm41nul) |
| **Group** | [t.me/codex_m41nul](https://t.me/codex_m41nul) |
| **YouTube** | [youtube.com/@codexm41nul](https://youtube.com/@codexm41nul) |
| **WhatsApp** | +8801308850528 |
| **Email** | devmainulislam@gmail.com |

</div>

---

## Support

If you like X-THEME, give it a star and share it!

<div align="center">

[![Star on GitHub](https://img.shields.io/github/stars/M41NUL/X-THEME?style=social)](https://github.com/M41NUL/X-THEME)
[![Fork](https://img.shields.io/github/forks/M41NUL/X-THEME?style=social)](https://github.com/M41NUL/X-THEME/fork)
[![Watch](https://img.shields.io/github/watchers/M41NUL/X-THEME?style=social)](https://github.com/M41NUL/X-THEME)

[![Join Telegram](https://img.shields.io/badge/Join-Telegram%20Channel-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/codexm41nul)

---

<sub>© 2026 CODEX-M41NUL · All Rights Reserved · <a href="https://github.com/M41NUL/X-THEME">github.com/M41NUL/X-THEME</a></sub>

</div>
