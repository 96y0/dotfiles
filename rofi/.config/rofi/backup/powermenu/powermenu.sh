#!/usr/bin/env bash

dir=$HOME/.config/rofi/backup/powermenu

hibernate='󰒲'
shutdown=''
reboot=''
lock=''
suspend=''
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
      loginctl poweroff
        ;;
    $reboot)
      loginctl reboot
        ;;
    $hibernate)
      loginctl hibernate
        ;;
    $lock)
      hyprlock
        ;;
    $suspend)
      loginctl suspend
        ;;
    $logout)
      hyprctl dispatch exit 
        ;;
esac
