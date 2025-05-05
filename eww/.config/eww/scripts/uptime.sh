#!/bin/bash

uptime=$(uptime -p)

week=$([[ $uptime == *"weeks"* || $uptime == *"week"* ]] && echo 1 || echo 0) 
day=$([[ $uptime == *"days"* || $uptime == *"day"* ]] && echo 1 || echo 0) 
hour=$([[ $uptime == *"hour"* || $uptime == *"hours"* ]] && echo 1 || echo 0)
min=$([[ $uptime == *"minute"* || $uptime == *"minutes"* ]] && echo 1 || echo 0)

if [[ week ]]; then
  uptime=$(echo $uptime | sed -E 's/ weeks, /w-/; s/ week, /w-/;')
fi

if [[ day && hour ]]; then
  uptime=$(echo $uptime | sed -E 's/ days, /:/; s/ day, /:/;')
  uptime=$(echo $uptime | sed -E 's/ hours, /:/; s/ hour, /:/;')
else 
  uptime=$(echo $uptime | sed -E 's/ days, /:00:/; s/ day, /:00:/;')
fi

uptime=$(echo $uptime | sed -E 's/ minutes/ mins./; s/ minute/ mins./;')


echo $uptime
