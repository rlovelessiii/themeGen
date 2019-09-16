#!/bin/bash

# launch.sh
# author: RLovelessIII
# description: launch script for generate_theme.sh

# Get current directory && current Operating System
DIR=$(dirname "$0");
OS=$(uname);

# Execute script correspoding to operating system
# DISCLAIMER: Only tested on Manjaro-i3 and MacOS 10.14 - 10.15
if [[ ${OS} == "Linux" ]]; then
    if zenity --question \
	--title="Theme Generator" \
	--text="Update theme?" \
	--no-wrap;
    then
      "${DIR}"/linux/generate_theme.sh;
      "${DIR}"/linux/apply_theme.sh;
    fi
elif [[ ${OS} == "Darwin" ]];
then
    photo=${1};
    "${DIR}"/macos/apply_theme.sh "${photo}";
else
    echo "OOPS! OS is not recognized. Please submit a bug report to RLovelessIII :)";
fi
exit 0;
