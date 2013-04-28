#!/bin/bash

# This shell script converts a set of png frames into jbig 2 encoded binary images
#
# Dependencies:
# 	ImageMagick
#
# Usage:
# 	frames2gif.sh

for f in out/*.png
do
	convert $f -type bilevel -colors 2 $f.gif
done
