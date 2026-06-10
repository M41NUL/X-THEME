#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — x-theme.sh  (main)
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"
source "$SCRIPT_DIR/updater.sh"
source "$SCRIPT_DIR/themes.sh"
source "$SCRIPT_DIR/fonts.sh"
source "$SCRIPT_DIR/banners.sh"
source "$SCRIPT_DIR/prompts.sh"
source "$SCRIPT_DIR/extrakeys.sh"
source "$SCRIPT_DIR/backup.sh"

# ── Box width (fixed, ASCII-safe) ─────────────────────────────────────────────
W_BOX=48

# ── Repeat a character N times ────────────────────────────────────────────────
_repeat() {
    local char="$1" n="$2"
    printf '%0.s'"$char" $(seq 1 "$n")
}

# ── Pixel art banner (green, bold) ────────────────────────────────────────────
_print_banner() {
echo -e "${G}${B}"
echo "  ██╗  ██╗      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗"
echo "  ╚██╗██╔╝      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝"
echo "   ╚███╔╝  █████╗  ██║   ███████║█████╗  ██╔████╔██║█████╗  "
echo "   ██╔██╗  ╚════╝  ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  "
echo "  ██╔╝ ██╗         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗"
echo "  ╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝"
echo -e "${RST}"
}

# ── Info card ─────────────────────────────────────────────────────────────────
_info_box() {
    local B_TOP="  ${O}${B}+$(_repeat '=' $W_BOX)+${RST}"
    local B_MID="  ${O}${B}+$(_repeat '=' $W_BOX)+${RST}"
    local B_BOT="  ${O}${B}+$(_repeat '=' $W_BOX)+${RST}"
    local B_DIV="  ${O}${B}+$(_repeat '-' $W_BOX)+${RST}"

    echo -e "$B_TOP"
    _cx_row "X-THEME  v1.0.0  --  Termux Customizer" "$W_BOX" "$G"
    echo -e "$B_DIV"

    _kv_row "Tool"     "X-THEME"                  10 "$W_BOX" "$G"  "$W"
    _kv_row "Version"  "1.0.0"                    10 "$W_BOX" "$CY" "$W"
    _kv_row "Dev"      "Md. Mainul Islam"          10 "$W_BOX" "$O"  "$W"
    _kv_row "Brand"    "CODEX-M41NUL"              10 "$W_BOX" "$O"  "$W"

    echo -e "$B_DIV"

    _kv_row "GitHub"   "github.com/M41NUL"         10 "$W_BOX" "$G"  "$DIM$W"
    _kv_row "Telegram" "t.me/codexm41nul"          10 "$W_BOX" "$CY" "$DIM$W"
    _kv_row "YouTube"  "youtube.com/@codexm41nul"  10 "$W_BOX" "$R"  "$DIM$W"

    echo -e "$B_DIV"
    _cx_row "(c) 2026 CODEX-M41NUL. All Rights Reserved." "$W_BOX" "$DIM$O"
    echo -e "$B_BOT"
    echo ""
}

# ── Center a row inside box ────────────────────────────────────────────────────
_cx_row() {
    local text="$1"
    local BW="$2"
    local tc="${3:-$G}"
    local vlen=${#text}
    local lpad=$(( (BW - vlen) / 2 ))
    local rpad=$(( BW - vlen - lpad ))
    printf "  ${O}${B}|${RST}%*s${tc}${B}%s${RST}%*s${O}${B}|${RST}\n" \
           "$lpad" "" "$text" "$rpad" ""
}

# ── Key-value row inside box ───────────────────────────────────────────────────
_kv_row() {
    local label="$1"
    local value="$2"
    local lw="$3"
    local BW="$4"
    local lc="${5:-$O}"
    local vc="${6:-$W}"
    local vlen=${#value}
    local used=$(( 1 + lw + 2 + vlen + 1 ))
    local rpad=$(( BW - used ))
    [ "$rpad" -lt 0 ] && rpad=0
    printf "  ${O}${B}|${RST} ${lc}${B}%-*s${RST}  ${vc}%s${RST}%*s${O}${B}|${RST}\n" \
           "$lw" "$label" "$value" "$rpad" ""
}

# ── Status bar ────────────────────────────────────────────────────────────────
_status_bar() {
    local ct cf cb cp
    ct=$(get_current "theme");   ct="${ct:-none}"
    cf=$(get_current "font");    cf="${cf:-default}"
    cb=$(get_current "banner");  cb="${cb:-none}"
    cp=$(get_current "prompt");  cp="${cp:-none}"

    echo -e "  ${DIM}${O}> Theme:${RST}${DIM}${W}${ct}  ${O}> Font:${RST}${DIM}${W}${cf}  ${O}> Banner:${RST}${DIM}${W}${cb}  ${O}> Prompt:${RST}${DIM}${W}${cp}${RST}"
    echo ""
}

# ── Main menu ─────────────────────────────────────────────────────────────────
_main_menu() {
    while true; do
        clear_screen
        _print_banner
        _info_box
        _status_bar

        # menu header
        echo -e "  ${O}${B}+$(_repeat '-' $W_BOX)+${RST}"
        printf  "  ${O}${B}|${RST}  ${G}${B}%-*s${RST}  ${O}${B}|${RST}\n" $(( W_BOX - 4 )) "MAIN MENU  --  X-THEME"
        echo -e "  ${O}${B}+$(_repeat '-' $W_BOX)+${RST}"
        echo ""

        _menu_item "1" "Theme Menu"       "50+ color themes"       "Dracula, Matrix, Cyberpunk..."
        _menu_item "2" "Font Menu"         "50+ fonts"              "JetBrains, FiraCode, Hack..."
        _menu_item "3" "Banner Menu"       "30+ MOTD banners"       "H4CK3R, Matrix, Ghost..."
        _menu_item "4" "Prompt Menu"       "20+ prompt styles"      "Hacker, Lambda, Powerline..."
        _menu_item "5" "Extra Keys Menu"   "Keyboard layouts"       "Hacker, Developer, Vim..."
        _menu_item "6" "Backup/Restore"    "Save & restore"         "All settings backed up"
        echo ""
        echo -e "  ${O}${B}+$(_repeat '-' $W_BOX)+${RST}"
        echo ""
        _menu_item "0" "Exit"              "Quit X-THEME"           ""
        echo ""
        separator
        echo ""

        local choice
        choice=$(prompt_input_fn "Select option")

        case "$choice" in
            1) theme_menu ;;
            2) font_menu ;;
            3) banner_menu ;;
            4) prompt_menu ;;
            5) extrakeys_menu ;;
            6) backup_menu ;;
            0)
                echo ""
                echo -e "  ${G}${B}+----------------------------------+${RST}"
                echo -e "  ${G}${B}|   Goodbye from X-THEME!          |${RST}"
                echo -e "  ${G}${B}+----------------------------------+${RST}"
                echo -e "  ${DIM}${O}  github.com/M41NUL  .  t.me/codexm41nul${RST}"
                echo ""
                exit 0 ;;
            *) warn_msg "Invalid option. Try again."; sleep 1 ;;
        esac
    done
}

# ── Menu item renderer ────────────────────────────────────────────────────────
_menu_item() {
    local num="$1" title="$2" sub1="$3" sub2="$4"
    printf "  ${O}${B}[%s]${RST}  ${G}${B}%-18s${RST}  ${DIM}${W}%s${RST}\n" \
           "$num" "$title" "$sub1"
    if [ -n "$sub2" ]; then
        printf "            ${DIM}${W}%-18s  %s${RST}\n" "" "$sub2"
    fi
    echo ""
}

# ── Input prompt ──────────────────────────────────────────────────────────────
prompt_input_fn() {
    local msg="$1"
    echo -ne "  ${O}${B}>${RST}  ${W}${msg}: ${RST}" >&2
    read -r val
    echo "$val"
}

# ── Entry point ───────────────────────────────────────────────────────────────
clear_screen
_print_banner
separator
echo ""
info_msg "Initializing X-THEME..."
echo ""
check_and_update
echo ""
ok_msg "Ready! Loading main menu..."
sleep 1
_main_menu
