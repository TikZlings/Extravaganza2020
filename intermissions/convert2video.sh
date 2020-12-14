#!/bin/bash

convert2video(){

    # compiling
    latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\mytitle{$2}" -usepretex extravaganza-intermission
    
    # clean up old video
    rm $1.mp4

    # convert to png images
    convert -density 160 $1-repeat.pdf $1.png

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%d.png -ss 00:00:04 -i JingleBells.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

}

# Converting
convert2video venice "A night in venice"

# clean up
rm *.aux
rm *.log
rm *.nav
rm *.snm
rm *.toc
rm *.out
rm *.png
rm *_raw.mp4
rm *.fdb_latexmk
rm *.fls