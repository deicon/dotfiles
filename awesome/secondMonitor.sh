#!/bin/bash
xrandr --output HDMI-1-0 --auto --right-of HDMI-2 &
nitrogen --restore
compton --config ~/.config/compton/compton.conf &
