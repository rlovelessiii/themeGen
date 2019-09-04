#!/usr/bin/env bash

# generate_theme.sh
# author: RLovelessIII
# description: Automate theme changing on Manjaro-i3

############
## Config ##
############

dir=$(dirname "$0");
. ${dir}/themeGen.conf;

###########################
## Variables from config ##
###########################

alpha=${window_transparency};
default_photo_dir=${path_to_cloud_drive}${cloud_background_directory};

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
  photo=${default_photo_dir};
fi

while true; do
	(
	echo "# Generating theme..." ; sleep 1
	wal -c;
	wal -a ${alpha} -i ${photo};
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
		break;
	fi
done

exit 0;
