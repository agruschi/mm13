#!/bin/bash

# This shell script splits a CIF YUV file into single png frames.
# The output files are stored in the out/ subdirectory
#
# Dependencies:
# 	ffmpeg

mkdir -p out
ffmpeg -s cif -i $1 -r 25 -qscale 1 -f image2 out/images%05d.png