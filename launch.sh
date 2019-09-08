#!/bin/bash

# launch.sh
# author: RLovelessIII
# description: launch script for generate_theme.sh

dir=$(dirname "$0");

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if zenity --question \
	--title="Theme Generator" \
	--text="Update theme?" \
	--no-wrap;
    then
      ${dir}/linux/generate_theme.sh;
      ${dir}/linux/apply_theme.sh;
    fi
elif [[ "$OSTYPE" == "darwin19" ]]; then
    echo "TODO";
else
    echo "OOPS!";
fi
exit 0;
