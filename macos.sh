#!/usr/bin/env bash

# macos.sh
# author: Richard Loveless III (RLovelessIII)
# description: Script that applies a new theme to MacOS 10.14 Mojave

function apply_theme {
  # Include Pywal executable path for remote execution
  wal="/usr/local/bin/wal"
  # Wallpaper Directory
  wallpaper_directory="${HOME}/.googleDrive/wallpapers/"
  ## Script that updates any JetBrains IDE color scheme to match Pywal color gen ##
  intellij_script="${HOME}/.scripts/intellijPywal/launch.sh"
  # Retrieve 1st arg (photo name) and append it to $wallpaper_directory
  photo_name=${1}
  path_to_photo=${wallpaper_directory}${photo_name}

  # Clear out current color-scheme cache && generate theme colors and set desktop wallpaper
  #     -i path to photo used for color generation
  #     --iterative used if choosing a random wallpaper,
  #          this will select the next wallpaper rather than a random one each time
  ${wal} -c && ${wal} -i "${path_to_photo}" --iterative

  # Execute IntelliJPywal script to update Jetbrains' IDE themes
  ${intellij_script}
}