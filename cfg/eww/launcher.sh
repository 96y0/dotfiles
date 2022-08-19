#!/bin/bash

killall eww 

if [[ ! `pidof eww` ]]; then
  eww daemon
fi

eww open mybar 
