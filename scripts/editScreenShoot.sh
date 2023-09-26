#!/bin/bash
FILENAME=$(date +%Y-%m-%d_%H%M%S.png) 
FILENAME=$(date +%Y-%m-%d_%H%M%S.png)
scrot $FILENAME -e 'xclip -selection clipboard -t image/png $f && rm $f'
drawing -c &
sleep 0.1
WINDOW_ID=$(xwininfo -tree -root | grep "Unsaved file" | grep -i "Unsaved file" | awk '{print $1}')
i3-msg "[id=$WINDOW_ID] move workspace 2"
 # Switch focus to workspace 2                              
i3-msg "workspace 9"
sleep 0.1
i3-msg "fullscreen toggle"
