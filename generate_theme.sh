#!/bin/bash

# generate_theme.sh
# author: RLovelessIII
# description: Automate theme changing on Manjaro-i3

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/themeGen.conf;

############
## Script ##
############

if zenity --question \
  --title="Theme Generator" \
  --text="Would you like to select select a specific wallpaper?\nSelect no for random." \
	--no-wrap;
then
  photo=$(zenity --file-selection);
else
  photo=$photo_dir;
fi

while true; do
	(
	echo "# Generating theme..." ; sleep 1
	wal -c;
	wal -a $alpha -i $photo;
    	) |
		zenity --progress \
	  	--title="Generate Theme" \
	  	--text="Generating Pywal color-scheme..." \
	  	--pulsate \
	  	--auto-close;

	if zenity --question \
		--text="Would you like to use this theme?" \
		--no-wrap;
	then
		cp $background_conf $dir;
		break;
	fi
done

# path to wallpaper => $wallpaper
. ${dir}/themeGen-wallpaper.conf;

###############
## Variables ##
###############

colors_oomox="${wal_cache}colors-oomox"
colors_gtk="${wal_cache}gtk-${theme_name}.xml";
background="${background_dir}/${background_name}";

(
echo "# Getting things ready..." ; sleep 4
gksu $dir/permissions.sh $colors_gtk $gtk3_themes_dir $wallpaper $background;
echo "# Updating color-scheme..." ; sleep 4
echo "# Updating widgets..." ; sleep 1
$oomox_theme_script -o $theme_name $wal_cache/$colors_oomox;
echo "# Updating icons..." ; sleep 1
$oomox_icons_script -o $theme_name $colors_oomox;
echo "# Updating JetBrains color-scheme..." ; sleep 4
$intellij_script $idea_conf;
$intellij_script $webstorm_conf;
$intellij_script $pycharm_conf;
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

exit 0
