#!/bin/bash

# permissions.sh
# author: Richard Loveless III
# description: Automate theme changing on Manjaro-i3 (Commands that need root access)

cp $1 $2;
convert $3 -blur 0x5 $4;

exit 0;
