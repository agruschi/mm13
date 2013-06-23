#!/bin/bash

# This shell script splits a CIF YUV file into single png frames.
# The output files are stored in the out/ subdirectory
#
# Dependencies:
# 	ffmpeg
#
# Usage:
# 	split.sh <INPUTFILE> [qcif]

FORMAT='cif'
if [ $2 ]
then
	FORMAT='qcif'
fi

echo "$FORMAT selected"

mkdir -p out
ffmpeg -v verbose -r 50 -i $1 -qscale 1 out/images%05d.bmp