#!/usr/bin/env bash

# generate_theme.sh
# author: RLovelessIII
# description: Automate theme changing on Manjaro-i3

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/config/manjaro_i3.conf;

###############
## Variables ##
###############

## $wallpaper_directory = Default directory for wallpapers
## $window_transparency = Window background transparency

############
## Script ##
############

if zenity --question \
  --title="Theme Generator" \
  --text="Choose wallpaper?\nNo for random." \
	--no-wrap;
then
  photo=$(zenity --file-selection);
else
  photo=${wallpaper_directory};
fi

while true; do
	(
	echo "# Generating theme..." ; sleep 1
	wal -c;
	wal -a ${window_transparency} -i ${photo};
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
