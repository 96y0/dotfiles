#!/bin/bash

if [ "$(rc-service NetworkManager status | grep 'inactive')" ]; then
  icon="󱚾"
  # col="#d78787"
  # bg="#0f0f17"
fi
if [ "$(nmcli g | grep -oE 'disconnected')" ]; then
  icon="󱛅" # disconnected
  # col="#bfc9db"
  # bg="#0f0f17"
else
  icon="󱚽" # connected
  # col="#0f0f17"
  # bg="#bfc9db"
fi


echo $icon
