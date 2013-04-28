#!/bin/bash

# This shell script converts a set of png frames into jbig 2 encoded binary images
#
# Dependencies:
# 	ImageMagick

for f in out/*.png
do
	jbig2 -s $f > $f.jb2
	convert $f -type bilevel -colors 2 $f.gif
done
