#!/bin/bash

convert2video(){

    # compiling
    # latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\mytitle{$2}" -usepretex extravaganza-intermission

    pdflatex --jobname=extravaganza-intermission-$1 "\def\mytitle{"$2"}\input{extravaganza-intermission}"
    pdflatex --jobname=extravaganza-intermission-$1 "\def\mytitle{"$2"}\input{extravaganza-intermission}"
    
    # clean up old video
    rm $1.mp4

    # convert to png images
    convert -density 160 extravaganza-intermission-$1.pdf $1.png

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%d.png -ss 00:00:04 -i JingleBells.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

    # clean up
    rm $1-*.png
    rm $1_raw.mp4
    rm extravaganza-intermission-$1.aux
    rm extravaganza-intermission-$1.log
    rm extravaganza-intermission-$1.nav
    rm extravaganza-intermission-$1.snm
    rm extravaganza-intermission-$1.toc
    rm extravaganza-intermission-$1.out

}

# Converting
convert2video venice "A night in venice"
convert2video baaaa "Baaaaaaaaa"


