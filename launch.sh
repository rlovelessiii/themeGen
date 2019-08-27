#!/bin/bash

# launch.sh
# author: RLovelessIII
# description: launch script for generate_theme.sh

dir=$(dirname "$0");

if zenity --question \
	--title="Theme Generator" \
	--text="Would you like to generate and apply a new theme?" \
	--no-wrap;
then
  $dir/generate_theme.sh
fi
exit 0
