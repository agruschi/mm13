#!/bin/bash

# This shell script converts a set of png frames into jbig 2 encoded binary images
#
# Dependencies:
# 	jbig2enc
#
# Usage:
# 	frames2jb2.sh

a=split/
if [ -z "$1" ]
  then
    echo "Using default split/"
   else
   	a=$1
   	echo "Using $a"
fi

for f in ${a}/images*.png
do

	# ---------- Red channel --------------------------------------------------

	convert $f -channel R -separate out/temp.png
	
	file=$(basename $f)

	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.r.0.jb2

	rm out/temp.png

	# ---------- Green channel --------------------------------------------------

	convert $f -channel G -separate out/temp.png
	
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.g.0.jb2

	rm out/temp.png

	# ---------- Blue channel --------------------------------------------------

	convert $f -channel B -separate out/temp.png
	
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > out/$file.b.0.jb2

	rm out/temp.png
done
