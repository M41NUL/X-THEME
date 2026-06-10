#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — themes.sh  (loader)
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

THEMES_DIR="$(dirname "$0")/themes"
COLORS_FILE="$HOME/.termux/colors.properties"

declare -A THEMES
declare -a THEME_NAMES

_add_theme() {
    local name="$1"; shift
    local vals=($*)
    THEMES["$name"]="${vals[*]}"
    THEME_NAMES+=("$name")
}

# ── Load category files ───────────────────────────────────────────────────────
_THEME_CATS=("hacker" "popular" "aesthetic" "minimal")
_THEME_CAT_LABELS=("Hacker/Cyber" "Popular/Dev Favorites" "Retro/Nature/Aesthetic" "Minimal/Clean")

for _tc in "${_THEME_CATS[@]}"; do
    [ -f "$THEMES_DIR/${_tc}.sh" ] && source "$THEMES_DIR/${_tc}.sh"
done

# ── Apply theme ───────────────────────────────────────────────────────────────
apply_theme() {
    local name="$1"
    local vals=(${THEMES[$name]})

    mkdir -p "$(dirname "$COLORS_FILE")"

    cat > "$COLORS_FILE" << EOF
# X-THEME: $name
background=${vals[0]}
foreground=${vals[1]}
color0=${vals[2]}
color1=${vals[3]}
color2=${vals[4]}
color3=${vals[5]}
color4=${vals[6]}
color5=${vals[7]}
color6=${vals[8]}
color7=${vals[9]}
color8=${vals[10]}
color9=${vals[11]}
color10=${vals[12]}
color11=${vals[13]}
color12=${vals[14]}
color13=${vals[15]}
color14=${vals[2]}
color15=${vals[1]}
EOF

    save_current "theme" "$name"
    apply_termux
    ok_msg "Theme applied: $name"
}

# ── Color swatch preview ──────────────────────────────────────────────────────
_swatch() {
    local name="$1"
    local vals=(${THEMES[$name]})
    local colors=("${vals[@]:2}")
    echo -ne "  "
    for hex in "${colors[@]}"; do
        local r=$((16#${hex:1:2}))
        local g=$((16#${hex:3:2}))
        local b=$((16#${hex:5:2}))
        echo -ne "\033[48;2;${r};${g};${b}m   \033[0m"
    done
    echo ""
}

# ── Theme menu ────────────────────────────────────────────────────────────────
theme_menu() {
    while true; do
        clear_screen
        _print_banner

        echo -e "  ${O}${B}┌$(printf '%0.s─' {1..48})┐${RST}"
        printf  "  ${O}${B}│${RST}  ${G}${B}%-46s${RST}  ${O}${B}│${RST}\n" "THEME MENU  —  X-THEME"
        echo -e "  ${O}${B}├$(printf '%0.s─' {1..48})┤${RST}"
        echo ""

        local current; current=$(get_current "theme")
        [ -n "$current" ] && info_msg "Active: ${G}${B}$current${RST}"
        echo ""

        local ci=1
        for label in "${_THEME_CAT_LABELS[@]}"; do
            printf "  ${O}${B}[%d]${RST}  ${G}${B}%s${RST}\n" "$ci" "$label"
            (( ci++ ))
        done

        echo ""
        printf "  ${O}${B}[a]${RST}  ${W}Show All Themes${RST}\n"
        printf "  ${O}${B}[0]${RST}  ${W}Back to Main Menu${RST}\n"
        echo ""
        separator

        local choice
        choice=$(prompt_input_fn "Select category")

        case "$choice" in
            0) return ;;
            a) _theme_list_all ;;
            [1-9])
                local idx=$(( choice - 1 ))
                local cat="${_THEME_CATS[$idx]}"
                [ -n "$cat" ] && _theme_list_cat "$cat" "${_THEME_CAT_LABELS[$idx]}" \
                    || { warn_msg "Invalid."; sleep 1; }
                ;;
            *) warn_msg "Invalid option."; sleep 1 ;;
        esac
    done
}

_theme_list_cat() {
    local cat_file="$THEMES_DIR/${1}.sh"
    local cat_label="$2"
    local cat_names=()

    while IFS= read -r line; do
        if [[ "$line" =~ ^_add_theme\ \"([^\"]+)\" ]]; then
            cat_names+=("${BASH_REMATCH[1]}")
        fi
    done < "$cat_file"

    while true; do
        clear_screen
        _print_banner
        echo -e "  ${G}${B}$cat_label${RST}  ${DIM}${W}(${#cat_names[@]} themes)${RST}\n"

        local i=1
        for name in "${cat_names[@]}"; do
            printf "  ${O}${B}[%2d]${RST}  ${W}%-22s${RST}  " "$i" "$name"
            _swatch "$name"
            (( i++ ))
        done

        echo ""
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter number to apply")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${cat_names[$idx]}"
            if [ -n "$name" ]; then
                apply_theme "$name"
                sleep 1
            else
                warn_msg "Invalid selection."; sleep 1
            fi
        else
            warn_msg "Invalid input."; sleep 1
        fi
    done
}

_theme_list_all() {
    while true; do
        clear_screen
        _print_banner
        echo -e "  ${G}${B}All Themes (${#THEME_NAMES[@]})${RST}\n"

        local i=1
        for name in "${THEME_NAMES[@]}"; do
            printf "  ${O}${B}[%2d]${RST}  ${W}%-22s${RST}  " "$i" "$name"
            _swatch "$name"
            (( i++ ))
        done

        echo ""
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter theme number")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${THEME_NAMES[$idx]}"
            if [ -n "$name" ]; then
                apply_theme "$name"
                sleep 1
            else
                warn_msg "Invalid selection."; sleep 1
            fi
        else
            warn_msg "Invalid input."; sleep 1
        fi
    done
}

prompt_input_fn() {
    local msg="$1"
    echo -ne "\n  ${O}${B}❯${RST}  ${W}${msg}: ${RST}" >&2
    read -r val
    echo "$val"
}
