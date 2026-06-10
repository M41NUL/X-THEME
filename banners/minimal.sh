#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — banners/minimal.sh
#  Category: Minimal / Clean / Simple
# ─────────────────────────────────────────

_add_banner "Minimal_Arrow" '\
\033[92m\033[1m
  ──────────────────────────────
   >> TERMUX
   >> ANDROID
   >> READY
  ──────────────────────────────\033[0m
'

_add_banner "Simple_Dash" '\
\033[97m
  ─────────────────────────────────
   user : '"$(whoami)"'
   host : termux
   os   : android
  ─────────────────────────────────\033[0m
'

_add_banner "Powerline_Style" '\
\033[42m\033[30m TERMUX \033[0m\033[32m\033[0m\033[44m\033[97m ANDROID \033[0m\033[34m\033[0m\033[46m\033[30m LINUX \033[0m\033[36m\033[0m
'

_add_banner "Clean_Box" '\
\033[96m\033[1m
  ┌──────────────────────────────┐
  │  termux  ·  android  ·  gnu  │
  └──────────────────────────────┘\033[0m
'

_add_banner "Wave" '\
\033[94m\033[1m
  ～～～～～～～～～～～～～～～～
    ❯  TERMUX READY
  ～～～～～～～～～～～～～～～～\033[0m
'

_add_banner "Dots_Line" '\
\033[38;5;208m\033[1m
  ·  ·  ·  ·  ·  ·  ·  ·  ·  ·
     T E R M U X   R E A D Y
  ·  ·  ·  ·  ·  ·  ·  ·  ·  ·\033[0m
'

_add_banner "Corner_Frame" '\
\033[93m\033[1m
  ╭────────────────────────────╮
  │   android + linux = ❤     │
  │   termux session started   │
  ╰────────────────────────────╯\033[0m
'

_add_banner "One_Liner" '\
\033[92m\033[1m  ─── termux ready · android · linux ───\033[0m
'

_add_banner "Gradient_Bar" '\
\033[91m▬\033[0m\033[38;5;208m▬▬\033[0m\033[93m▬▬\033[0m\033[92m▬▬\033[0m\033[96m▬▬\033[0m\033[94m▬▬\033[0m\033[95m▬▬▬\033[0m
\033[97m\033[1m  TERMUX  ·  READY\033[0m
\033[95m▬▬▬\033[0m\033[94m▬▬\033[0m\033[96m▬▬\033[0m\033[92m▬▬\033[0m\033[93m▬▬\033[0m\033[38;5;208m▬▬\033[0m\033[91m▬\033[0m
'
