#!/usr/bin/env sh

# This file is intended to be used by Hazel.
# It takes an avi movie and passes it to HandBrake
# with a specific output folder.

# Carlos Fonseca
# carlosefonseca@gmail.com
# 2011-04-30

FILE=`basename -s .avi "$1"`.mp4
OUT="/Users/carlos/Downloads/MP4/$FILE"
nice -n +100 HandBrakeCLI -i "$1" -o "$OUT" --preset="iPhone & iPod Touch"