#!/bin/sh

#Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#Disable monitor powersave and screensaver, start xscreensaver
setterm -blank 0 -powersave off -powerdown 0
xset s off
/usr/bin/xscreensaver -no-splash &

#Turn on numlock
numlockx

#Remap keys
xmodmap ~/.xmodmap

#Set wallpaper
sh ~/.fehbg &

#Start i3 Window Manager
exec i3
