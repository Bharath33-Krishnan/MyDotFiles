#!/bin/bash
# nmtui
PLAYERCTL_STATUS=$(playerctl --player="spotify" status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
   playerctl play-pause -p spotify
else
   spotify
fi
   
