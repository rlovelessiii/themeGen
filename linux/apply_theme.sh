#!/usr/bin/env bash

# linux/apply_theme.sh
# Author: RLovelessIII
# Description: Script that applies the newly generated theme

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/config/manjaro_i3.conf;
. ${wal_colors};

###############
## Variables ##
###############

# # # # # # # # # #
# manjaro_i3.conf #
# # # # # # # # # #
## $theme_name = Name for generated themes
## $lock_screen = Path to image used in the greeter
## $gtk3_themes_directory = Path to GTK3 color-scheme directory
## $wal_colors = File generated by Pywal with theme colors & wallpaper variables
## $wal_colors_gtk = File generated from template for GTK3 theme
## $wal_colors_oomox = File generated from template for Oomox theme/icons
## $oomox_theme_script = Updates Oomox theme using the color-scheme from Pywal
## $oomox_icons_script = Updates Oomox icons using the color-scheme from Pywal
## $intellij_script = Updates Jetbrains IDE themes using the color-scheme from Pywal
## $idea_config = Path to Intellij's config
## $webstorm_config = Path to Webstorm's config
## $pycharm_config = Path to Pycharm's config
## $remote_host = Name of remote PC to sync themes

# # # # # # # # #
# ${wal_colors} #
# # # # # # # # #
## $wallpaper = Local path to wallpaper used for theme

############
## Script ##
############

(
echo "# Getting things ready..." ; sleep 4
gksu ${dir}/permissions.sh ${wal_colors_gtk} ${gtk3_themes_directory} ${wallpaper} ${lock_screen};
echo "# Updating theme..." ; sleep 1
${oomox_theme_script} -o ${theme_name} ${wal_colors_oomox};
echo "# Updating icons..." ; sleep 1
${oomox_icons_script} -o ${theme_name} ${wal_colors_oomox};
echo "# Updating JetBrains color-scheme..." ; sleep 4
${intellij_script} ${idea_config};
${intellij_script} ${webstorm_config};
${intellij_script} ${pycharm_config};
echo "# Applying theme..." ; sleep 5
) |
zenity --progress \
    --title="Generate Theme" \
	  --pulsate \
	  --time-remaining \
	  --auto-kill \
	  --auto-close;

if zenity --question \
    --text="Complete! Would you also like to update \"${remote_host}\" using this theme?" \
    --no-wrap;
then
    IFS='/' read -r -a  path_to_wallpaper <<< ${wallpaper};
    wallpaper=${path_to_wallpaper[-1]};

    echo "update-theme ${wallpaper}" | ssh -tt macos;
fi

if zenity --question \
    --text="Complete! Changes won't take full effect until your next session.\nWould you like to logout now?" \
    --no-wrap;
then
	  i3exit logout;
else
	  i3-msg restart;
fi

exit 0;