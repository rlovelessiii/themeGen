#!/usr/bin/env bash

# linux/generate_theme.sh
# author: RLovelessIII
# description: Automate theme changing on Manjaro-i3

# Get current directory
DIR=$(dirname "$0");

############
## Config ##
############

# # # # # # # # # # #
#  manjaro_i3.conf  #
# # # # # # # # # # #
. ${DIR}/config/manjaro_i3.conf;
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  $wallpaper_directory = Default directory for wallpapers  #
#  $window_transparency = Window background transparency    #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

############
## Script ##
############

# Prompt user for photo selection, if no then a random photo is choosen from the $wallpaper_directory
if zenity --question \
  --title="Theme Generator" \
  --text="Choose wallpaper?\nNo for random." \
	--no-wrap;
then
  photo=$(zenity --file-selection);
else
  photo=${wallpaper_directory};
fi

# Prompt user if they want to use the new theme,
# Loops until user selects 'yes'
while true; do
	(
	echo "# Generating theme..." ; sleep 1
	# Clear out current color-scheme cache
	wal -c;
	# Use Pywal (wal) to generate theme colors and set desktop wallpaper
	# -a sets window transparency
	# -i path to photo used for color generation
	# --iterative used if choosing a random wallpaper, this will select the next wallpaper rather than a random one each time
	wal -a ${window_transparency} -i ${photo} --iterative;
    	) |
		zenity --progress \
	  	--title="Generate Theme" \
	  	--pulsate \
	  	--auto-close;

	if zenity --question \
		--text="Would you like to use this theme?" \
		--no-wrap;
	then
		break;
	fi
done

exit 0;
