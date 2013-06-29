#!/bin/bash

# This shell script splits a YUV file into single png frames.
# The output files are stored in the out/ subdirectory
#
# Dependencies:
# 	ffmpeg
#
# Usage:
# 	split.sh <INPUTFILE>

mkdir -p out
ffmpeg -i $1 -qscale 1 -f image2 split/images%05d.png