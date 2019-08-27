#!/bin/bash

# permissions.sh
# author: Richard Loveless III
# description: Automate theme changing on Manjaro-i3

src1=$1;
des1=$2;
src2=$3;
des2=$4;

cp $src1 $des1;
convert ${src2} -blur 0x5 $des2;

exit 0;
