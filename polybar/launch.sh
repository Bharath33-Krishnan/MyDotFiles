#!/usr/bin/env bash
#  ╔═╗╔╦╗╦╦  ╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║╣ ║║║║║  ║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩ ╩╩╩═╝╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Emilia
bspc config border_width 2
bspc config top_padding 20
# bspc config bottom_padding 5
bspc config normal_border_color "#41486844"
bspc config active_border_color "#c0caf544"
bspc config focused_border_color "#bb9af744"
bspc config presel_feedback_color "#7aa2f744"
# bspc config left_padding 5
# bspc config right_padding 5
bspc config window_gap 5

# Launch the bar
polybar -q emi-bar -c $HOME/.config/polybar/config.ini &

#Use syndaemon to disable touchpad synaptics while typing
syndaemon -i 0.3 -t -K -R -d

nm-applet &
blueman-applet &
