#!/bin/bash

# This shell script splits a CIF YUV file into single png frames.
# The output files are stored in the out/ subdirectory
#
# Dependencies:
# 	ffmpeg

ffmpeg -i out/images%05d.png -pix_fmt yuv444p $1
