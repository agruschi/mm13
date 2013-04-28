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

mplayer -demuxer rawvideo -rawvideo w=352:h=288:format=i420 $1 -loop 0