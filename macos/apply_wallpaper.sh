#!/usr/bin/env bash

# macos/apply_wallpaper.sh
# author: Richard Loveless III (RLovelessIII)
# description: Apply the chosen image to desktop wallpaper for MacOS 10.15 Beta

dir=$(dirname "$0");
. ${dir}/config/macos_catalina.conf;
. ${wal_colors};

sqlite3 "${db}" "UPDATE data SET value = '${wallpaper}' WHERE ROWID = 1";

killall Dock;

exit 0;