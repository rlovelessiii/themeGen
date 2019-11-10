#!/usr/bin/env bash

# linux/permissions.sh
# author: Richard Loveless III (RLovelessIII)
# description: Automate theme changing on Manjaro-i3 (Commands that need root access)

###############
## Arguments ##
###############

## $1 = Path to xml file generated by Pywal
## $2 = Path to the directory where GTK3 color-schemes are located
## $3 = Path to wallpaper used
## $4 = Path to the image used for the lock/login screen

############
## Script ##
############

cp "$1" "$2"
convert "$3" -blur 0x5 "$4"