#!/bin/bash

max_brightness=$(brightnessctl m)
curr_brightness=$(brightnessctl g)
brightness=$((100 * curr_brightness / max_brightness))

echo $brightness

