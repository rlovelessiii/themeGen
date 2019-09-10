#!/usr/bin/env bash

# macos/apply_theme.sh
# author: Richard Loveless III (RLovelessIII)
# description: Script that applies a new theme to MacOS 10.15 Beta

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/config/macos_catalina.conf;

photo=${wallpaper_directory}${1};
wal="/usr/local/bin/wal";

${wal} -c;
${wal} -n -i ${photo};

${dir}/apply_wallpaper.sh;

exit 0;