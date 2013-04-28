#!/bin/bash

# This shell script runs the tests
#
# Dependencies:
# 	split.sh
#	frames2jb2.sh
#
# Usage:
# 	run.sh

time sh -c "./split.sh $1; ./frames2jb2.sh"
find . -name "*.jb2" -ls | awk '{total += $7} END {print total}'

time sh -c "./split.sh $1; ./frames2gif.sh"
find . -name "*.gif" -ls | awk '{total += $7} END {print total}'

rm -r out/