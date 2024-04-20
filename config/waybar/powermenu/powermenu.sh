#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Reload\n\uf023 Lock\n Logout" | wofi -Dhide_search=true --style ~/.config/waybar/powermenu/style.css -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
            loginctl poweroff;;
        reboot)
            loginctl reboot;;
        suspend)
            ;;
        reload)
            hyprctl reload;;
        lock)
            hyprlock;;
        logout)
            hyprctl dispatch exit;;
esac
