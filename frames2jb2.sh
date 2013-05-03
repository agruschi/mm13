#!/bin/bash

# This shell script converts a set of png frames into jbig 2 encoded binary images
#
# Dependencies:
# 	jbig2enc
#
# Usage:
# 	frames2jb2.sh

for f in out/*.png
do
	echo "frame $f"
	convert $f -channel R -separate out/temp.png
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 -s out/tempbp.png > $f.0.jb2

	rm out/temp.png
done
