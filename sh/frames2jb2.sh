#!/bin/bash

# This shell script converts a set of bmp frames into jbig 2 encoded binary images
#
# Dependencies:
# 	jbig2enc
#
# Usage:
# 	frames2jb2.sh

for f in out/*.png
do
	echo "frame $f"
	convert $f -channel R -separate out/temp.bmp

	# MSB
	convert out/temp.bmp -fx '(int(u*255)&128)' out/tempbp7.png
	#jbig2 -S -p -O out/outR7.bmp out/tempbp7.png
	jbig2 -v out/tempbp7.png > $f.r.7.jb2

	convert out/temp.bmp -fx '(int(u*255)&64)' out/tempbp6.png
	#jbig2 -S -p -O out/outR6.bmp out/tempbp6.png
	jbig2  out/tempbp6.png > $f.r.6.jb2

	convert out/temp.bmp -fx '(int(u*255)&32)' out/tempbp5.png
	#jbig2 -S -p -O out/outR5.bmp out/tempbp5.png
	jbig2 out/tempbp5.png > $f.r.5.jb2

	convert out/temp.bmp -fx '(int(u*255)&16)' out/tempbp4.png
	#jbig2 -S -p -O out/outR4.bmp out/tempbp4.png
	jbig2 out/tempbp4.png > $f.r.4.jb2

	convert out/temp.bmp -fx '(int(u*255)&8)' out/tempbp3.png
	#jbig2 -S -p -O out/outR3.bmp out/tempbp3.png
	jbig2 out/tempbp3.png > $f.r.3.jb2

	convert out/temp.bmp -fx '(int(u*255)&4)' out/tempbp2.png
	#jbig2 -S -p -O out/outR2.bmp out/tempbp2.png
	jbig2 out/tempbp2.png > $f.r.2.jb2

	convert out/temp.bmp -fx '(int(u*255)&2)' out/tempbp1.png
	#jbig2 -S -p -O out/outR1.bmp out/tempbp1.png
	jbig2 out/tempbp1.png > $f.r.1.jb2

	convert out/temp.bmp -fx '(int(u*255)&1)' out/tempbp0.png
	#jbig2 -S -p -O out/outR0.bmp out/tempbp0.png
	jbig2 out/tempbp0.png > $f.r.0.jb2

	rm out/temp.bmp

	convert $f -channel G -separate out/temp.bmp
	# # MSB
	convert out/temp.bmp -fx '(int(u*255)&128)' out/tempbp7.png
	jbig2 -s out/tempbp7.png > $f.g.7.jb2

	convert out/temp.bmp -fx '(int(u*255)&64)' out/tempbp6.png
	jbig2 -s out/tempbp6.png > $f.g.6.jb2

	convert out/temp.bmp -fx '(int(u*255)&32)' out/tempbp5.png
	jbig2 -s out/tempbp5.png > $f.g.5.jb2

	convert out/temp.bmp -fx '(int(u*255)&16)' out/tempbp4.png
	jbig2 -s out/tempbp4.png > $f.g.4.jb2

	convert out/temp.bmp -fx '(int(u*255)&8)' out/tempbp3.png
	jbig2 -s out/tempbp3.png > $f.g.3.jb2

	convert out/temp.bmp -fx '(int(u*255)&4)' out/tempbp2.png
	jbig2 -s out/tempbp2.png > $f.g.2.jb2

	convert out/temp.bmp -fx '(int(u*255)&2)' out/tempbp1.png
	jbig2 -s out/tempbp1.png > $f.g.1.jb2

	convert out/temp.bmp -fx '(int(u*255)&1)' out/tempbp0.png
	jbig2 -s out/tempbp0.png > $f.g.0.jb2

	rm out/temp.bmp

	convert $f -channel B -separate out/temp.bmp
	# MSB
	convert out/temp.bmp -fx '(int(u*255)&128)' out/tempbp7.png
	jbig2 -s out/tempbp7.png > $f.b.7.jb2

	convert out/temp.bmp -fx '(int(u*255)&64)' out/tempbp6.png
	jbig2 -s out/tempbp6.png > $f.b.6.jb2

	convert out/temp.bmp -fx '(int(u*255)&32)' out/tempbp5.png
	jbig2 -s out/tempbp5.png > $f.b.5.jb2

	convert out/temp.bmp -fx '(int(u*255)&16)' out/tempbp4.png
	jbig2 -s out/tempbp4.png > $f.b.4.jb2

	convert out/temp.bmp -fx '(int(u*255)&8)' out/tempbp3.png
	jbig2 -s out/tempbp3.png > $f.b.3.jb2

	convert out/temp.bmp -fx '(int(u*255)&4)' out/tempbp2.png
	jbig2 -s out/tempbp2.png > $f.b.2.jb2

	convert out/temp.bmp -fx '(int(u*255)&2)' out/tempbp1.png
	jbig2 -s out/tempbp1.png > $f.b.1.jb2

	convert out/temp.bmp -fx '(int(u*255)&1)' out/tempbp0.png
	jbig2 -s out/tempbp0.png > $f.b.0.jb2

	rm out/temp.bmp
done
