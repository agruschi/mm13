#!/bin/bash

for f in out/*.png
do
	java -classpath bin/ multimedia2013.GrayCode $f
done