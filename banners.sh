#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — banners.sh  (loader)
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
#  Loads all banner categories from
#  the banners/ subfolder
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

MOTD_FILE="$HOME/.termux/motd"
BANNERS_DIR="$(dirname "$0")/banners"

declare -A BANNERS
declare -a BANNER_NAMES
declare -A BANNER_CATEGORY

# ── Register function ─────────────────────────────────────────────────────────
_add_banner() {
    local name="$1"; shift
    BANNERS["$name"]="$*"
    BANNER_NAMES+=("$name")
}

# ── Load all category files ───────────────────────────────────────────────────
_CATEGORIES=("hacker" "matrix" "retro" "minimal" "nature" "brand" "fun")
_CATEGORY_LABELS=("Hacker/Cyber" "Matrix/Cyberpunk" "Retro/Classic" "Minimal/Clean" "Nature/Space/Art" "Brand/Personal" "Fun/Anime")

for _cat in "${_CATEGORIES[@]}"; do
    local _cat_file="$BANNERS_DIR/${_cat}.sh"
    if [ -f "$_cat_file" ]; then
        source "$_cat_file"
    fi
done

# None option always last
_add_banner "None" ''

# ── Apply banner ──────────────────────────────────────────────────────────────
apply_banner() {
    local name="$1"
    local content="${BANNERS[$name]}"

    mkdir -p "$(dirname "$MOTD_FILE")"

    if [ "$name" = "None" ]; then
        echo -n "" > "$MOTD_FILE"
        save_current "banner" "None"
        ok_msg "Banner removed."
        return
    fi

    printf "%b" "$content" > "$MOTD_FILE"
    save_current "banner" "$name"
    ok_msg "Banner applied: $name"
}

# ── Banner preview ────────────────────────────────────────────────────────────
_preview_banner() {
    local name="$1"
    local content="${BANNERS[$name]}"
    echo ""
    separator
    echo -e "  ${O}${B}Preview: ${G}$name${RST}"
    separator
    printf "%b\n" "$content"
    separator
}

# ── Banner menu (category view) ───────────────────────────────────────────────
banner_menu() {
    while true; do
        clear_screen
        _print_banner

        echo -e "  ${O}${B}┌$(printf '%0.s─' {1..48})┐${RST}"
        printf  "  ${O}${B}│${RST}  ${G}${B}%-46s${RST}  ${O}${B}│${RST}\n" "BANNER MENU  —  X-THEME"
        echo -e "  ${O}${B}├$(printf '%0.s─' {1..48})┤${RST}"
        echo ""

        local current; current=$(get_current "banner")
        [ -n "$current" ] && info_msg "Active: ${G}${B}$current${RST}"
        echo ""

        # Show categories
        local ci=1
        for label in "${_CATEGORY_LABELS[@]}"; do
            printf "  ${O}${B}[%d]${RST}  ${G}${B}%s${RST}\n" "$ci" "$label"
            (( ci++ ))
        done

        echo ""
        printf "  ${O}${B}[a]${RST}  ${W}Show All Banners${RST}\n"
        printf "  ${O}${B}[x]${RST}  ${W}Remove Banner (None)${RST}\n"
        printf "  ${O}${B}[0]${RST}  ${W}Back to Main Menu${RST}\n"
        echo ""
        separator

        local choice
        choice=$(prompt_input_fn "Select category or option")

        case "$choice" in
            0) return ;;
            a) _banner_list_all ;;
            x) apply_banner "None"; sleep 1 ;;
            [1-9])
                local idx=$(( choice - 1 ))
                local cat="${_CATEGORIES[$idx]}"
                if [ -n "$cat" ]; then
                    _banner_list_category "$cat" "${_CATEGORY_LABELS[$idx]}"
                else
                    warn_msg "Invalid selection."; sleep 1
                fi
                ;;
            *) warn_msg "Invalid option."; sleep 1 ;;
        esac
    done
}

# ── List banners in a category ────────────────────────────────────────────────
_banner_list_category() {
    local cat_file="$BANNERS_DIR/${1}.sh"
    local cat_label="$2"

    # get names from this category file
    local cat_names=()
    while IFS= read -r line; do
        if [[ "$line" =~ ^_add_banner\ \"([^\"]+)\" ]]; then
            cat_names+=("${BASH_REMATCH[1]}")
        fi
    done < "$cat_file"

    while true; do
        clear_screen
        _print_banner
        echo -e "  ${O}${B}┌$(printf '%0.s─' {1..48})┐${RST}"
        printf  "  ${O}${B}│${RST}  ${G}${B}%-46s${RST}  ${O}${B}│${RST}\n" "$cat_label"
        echo -e "  ${O}${B}└$(printf '%0.s─' {1..48})┘${RST}"
        echo ""

        local i=1
        for name in "${cat_names[@]}"; do
            printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
            (( i++ ))
        done

        echo ""
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter number to preview & apply")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${cat_names[$idx]}"
            if [ -n "$name" ]; then
                _preview_banner "$name"
                echo ""
                echo -ne "  ${O}${B}Apply this banner? [y/N]:${RST} "
                read -r confirm
                if [[ "$confirm" =~ ^[Yy]$ ]]; then
                    apply_banner "$name"
                    sleep 1
                fi
            else
                warn_msg "Invalid selection."; sleep 1
            fi
        else
            warn_msg "Invalid input."; sleep 1
        fi
    done
}

# ── List ALL banners flat ─────────────────────────────────────────────────────
_banner_list_all() {
    while true; do
        clear_screen
        _print_banner
        echo -e "  ${G}${B}All Banners (${#BANNER_NAMES[@]})${RST}\n"

        local i=1
        for name in "${BANNER_NAMES[@]}"; do
            printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
            (( i++ ))
        done

        echo ""
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter number to preview & apply")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${BANNER_NAMES[$idx]}"
            if [ -n "$name" ]; then
                _preview_banner "$name"
                echo ""
                echo -ne "  ${O}${B}Apply this banner? [y/N]:${RST} "
                read -r confirm
                if [[ "$confirm" =~ ^[Yy]$ ]]; then
                    apply_banner "$name"
                    sleep 1
                fi
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
