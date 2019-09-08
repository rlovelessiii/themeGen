#!/usr/bin/env bash

# macos/apply_theme.sh
# author: Richard Loveless III (RLovelessIII)
# description: Script that applies a new theme to MacOS 10.15 Beta

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/config/macos_catalina.conf;

wal -c;
wal -n -i ${wallpaper_directory}/$1;

exit 0;