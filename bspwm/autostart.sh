#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

$HOME/.config/polybar/launch.sh &

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
dunst &

#DualMonitor
#xrandr --output eDP1 --mode 1920x1080 --pos 2560x0 --rotate normal --output HDMI1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off &
$HOME/.config/bspwm/dualmonitor.sh &
/usr/bin/emacs --daemon &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom -b --config $HOME/.config/picom/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/bin/emacs --daemon &
run volumeicon &
nitrogen --restore &
conky &
$HOME/.config/conky/Er-Rai/start.sh &
