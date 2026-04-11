#!/run/current-system/sw/bin/bash

if pgrep .obs-wrapped >/dev/null 2>&1
  then
    notify-send "Clip Captured!"
  else
    notify-send "OBS isnt running!"
fi
