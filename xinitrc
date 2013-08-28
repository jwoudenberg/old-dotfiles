#!/bin/sh

#Disable monitor powersave and screensaver
setterm -blank 0 -powersave off -powerdown 0
xset s off

#Turn on numlock
numlockx

#Start Awesome Window Manager
exec awesome
