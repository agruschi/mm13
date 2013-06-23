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
	# ---------- Red channel --------------------------------------------------

	convert $f -channel R -separate out/temp.png
	
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > $f.r.0.jb2

	rm out/temp.png

	# ---------- Green channel --------------------------------------------------

	convert $f -channel G -separate out/temp.png
	
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > $f.g.0.jb2

	rm out/temp.png

	# ---------- Blue channel --------------------------------------------------

	convert $f -channel B -separate out/temp.png
	
	# MSB
	convert out/temp.png -fx '(int(u*255)&128)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.7.jb2

	convert out/temp.png -fx '(int(u*255)&64)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.6.jb2

	convert out/temp.png -fx '(int(u*255)&32)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.5.jb2

	convert out/temp.png -fx '(int(u*255)&16)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.4.jb2

	convert out/temp.png -fx '(int(u*255)&8)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.3.jb2

	convert out/temp.png -fx '(int(u*255)&4)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.2.jb2

	convert out/temp.png -fx '(int(u*255)&2)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.1.jb2

	convert out/temp.png -fx '(int(u*255)&1)' out/tempbp.png
	jbig2 out/tempbp.png > $f.b.0.jb2

	rm out/temp.png
done
