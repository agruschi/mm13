#!/bin/bash

# This shell script allows playback of a YUV video file.
# A YUV video file (extension .yuv) is just a container for raw (headerless) lossless yuv images.
# Change w:X and h:Y values to change the expected image dimensions (QCIF and CIF)
#
# Dependencies:
# 	mplayer
#
# Usage:
# 	yuvplay.sh <INPUTFILE>

mplayer -demuxer rawvideo -rawvideo fps=50:w=1280:h=720:format=444p:size=2764800 $1 -loop 0