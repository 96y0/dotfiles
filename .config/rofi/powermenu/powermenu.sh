#!/usr/bin/env bash

dir=$HOME/.config/rofi/powermenu

hibernate='󰤄'
shutdown=''
reboot=''
lock=''
suspend=''
logout=''

rofi_cmd() {
  rofi -dmenu -theme "$dir/powermenu.rasi"
}

run_rofi() {
  echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

op=$(run_rofi)
case ${op} in
    $shutdown)
      poweroff
        ;;
    $reboot)
      reboot
        ;;
    $hibernate)
      systemctl hibernate
        ;;
    $lock)
      hyprlock
        ;;
    $suspend)
      hyprlock & disown && systemctl suspend
        ;;
    $logout)
      hyprctl dispatch exit 
        ;;
esac
