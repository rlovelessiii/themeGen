#!/bin/bash

# launch.sh
# author: RLovelessIII
# description: launch script for generate_theme.sh

dir=$(dirname "$0");

os=$(uname);

if [[ ${os} == "Linux" ]]; then
    if zenity --question \
	--title="Theme Generator" \
	--text="Update theme?" \
	--no-wrap;
    then
      ${dir}/linux/generate_theme.sh;
      ${dir}/linux/apply_theme.sh;
    fi
elif [[ ${os} == "Darwin" ]];
then
    ${dir}/macos/apply_theme.sh ${1};
else
    echo "OOPS!";
fi
exit 0;
