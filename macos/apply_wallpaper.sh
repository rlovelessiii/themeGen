#!/usr/bin/env bash

# macos/apply_wallpaper.sh
# author: Richard Loveless III (RLovelessIII)
# description: Apply the chosen image to desktop wallpaper for MacOS 10.15 Beta

dir=$(dirname "$0");
. ${dir}/config/macos_catalina.conf;

sqlite3 "${db}" "UPDATE data SET value = '${1}' WHERE ROWID = 1";

echo ${query};

killall Dock;

exit 0;