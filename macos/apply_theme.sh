#!/usr/bin/env bash

# macos/apply_theme.sh
# author: Richard Loveless III (RLovelessIII)
# description: Script that applies a new theme to MacOS 10.15 Beta

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/config/macos.conf;

photo=${wallpaper_directory}${1};
wal="/usr/local/bin/wal";

${wal} -c;
${wal} -i ${photo};

${intellij_script} ${idea_config};
${intellij_script} ${webstorm_config};
${intellij_script} ${pycharm_config};

exit 0;