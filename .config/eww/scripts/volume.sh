#!/bin/bash

while true; do
  pulsemixer --get-volume | awk '{print $1}'

  sleep 1
done
