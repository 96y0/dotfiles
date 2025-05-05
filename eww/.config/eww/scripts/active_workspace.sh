#!/bin/bash


print_active() {
  echo $(hyprctl monitors -j | jq '.[] | .activeWorkspace | .id')
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do print_active; done
