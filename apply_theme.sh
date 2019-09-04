#!/usr/bin/env bash

# apply_theme.sh
# Author: RLovelessIII
# Description: Script that applies the newly generated theme

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/themeGen.conf;
. ${wal_cache_dir}/colors.sh;

###############
## Variables ##
###############
# themeGen.conf
theme=${theme_name};
cloud_dir=${path_to_cloud_drive}${cloud_themeGen_directory};
lock_screen=${lock_screen_dir}${lock_screen_background_name};
themes_dir=${gtk3_themes_dir};
colors_gtk="${wal_cache_dir}${theme}.xml";
colors_oomox="${wal_cache_dir}colors-oomox";
apply_theme=${oomox_theme_script};
apply_icons=${oomox_icons_script};
apply_jetbrains_theme=${intellij_script};
idea=${idea_config};
webstorm=${webstorm_config};
pycharm=${pycharm_config};
# colors.sh
wallpaper=${wallpaper};

############
## Script ##
############

# Writes the name of the wallpaper to the cloud directory
IFS='/' read -r -a  path_to_wallpaper <<< ${wallpaper};
echo ${path_to_wallpaper[-1]} > "${cloud_dir}/wallpaper.conf";

(
echo "# Getting things ready..." ; sleep 4
gksu ${dir}/permissions.sh ${colors_gtk} ${themes_dir} ${wallpaper} ${lock_screen};
echo "# Updating color-scheme..." ; sleep 4
echo "# Updating widgets..." ; sleep 1
${apply_theme} -o ${theme} ${colors_oomox};
echo "# Updating icons..." ; sleep 1
${apply_icons} -o ${theme} ${colors_oomox};
echo "# Updating JetBrains color-scheme..." ; sleep 4
${apply_jetbrains_theme} ${idea};
${apply_jetbrains_theme} ${webstorm};
${apply_jetbrains_theme} ${pycharm};
echo "# Applying theme..." ; sleep 5
) |
zenity --progress \
	--title="Generate Theme" \
  --text="Generating Pywal color-scheme..." \
	--pulsate \
	--time-remaining \
	--auto-kill \
	--auto-close;

if zenity --question \
	--text="Complete! Changes won't take full effect until your next session.\nWould you like to logout now?" \
	--no-wrap;
then
	i3exit logout;
else
	i3-msg restart;
fi

exit 0;