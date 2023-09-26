#!/bin/bash

# Get the ID of the touchpad
touchpad_id=$(xinput list | grep -i touchpad | grep -o 'id=[0-9]*' | grep -o '[0-9]*')

# Set the scrolling speed to a specified value (in this case, 100)
xinput set-prop $touchpad_id 'Synaptics Scrolling Distance' -200, -200

echo $touchpad_id
