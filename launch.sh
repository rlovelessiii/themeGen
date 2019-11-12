#!/usr/bin/env bash

# launch.sh
# author: RLovelessIII
# description: launch script for themeGen

# Get current directory && current Operating System
DIR=$(dirname "$0")
OS=$(uname)

# Execute script correspoding to operating system
if [[ ${OS} == "Linux" ]]
 then
    if zenity --question \
      --title="Theme Generator" \
      --text="Update theme?" \
      --no-wrap
    then
      . "${DIR}/manjaro_i3.sh"
      update_wallpapers && \
      generate_theme && \
      permissions && \
      apply_theme && \
      update_remote && \
      restart_logout
    fi
elif [[ ${OS} == "Darwin" ]]
then
    . "${DIR}/macos.sh"
    update_wallpapers && apply_theme "${1}"
else
    echo "OOPS! OS is not recognized. Please submit a bug report to RLovelessIII :)"
fi
