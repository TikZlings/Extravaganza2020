#!/bin/bash

# passing a title to the intermission
# Params:
# 1: jobname
# 2: some string for the title
convert2video(){

    # compiling
    latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\mytitle{$2}" -usepretex extravaganza-intermission
    
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
    rm extravaganza-intermission-$1.fls
    rm extravaganza-intermission-$1.fdb_latexmk

}

# repeat an existing pdf several times
# Params:
# 1: jobname
# 2: path and name to the pdf file
# 3: number of repetitions [default 75]
repeatconvert(){

    # compiling
    latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\filename{$2}\def\myrepeat{$3}" -usepretex repeat  
    
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
    rm extravaganza-intermission-$1.fls
    rm extravaganza-intermission-$1.fdb_latexmk
        
}

# Converting
convert2video bobbles "Christmas Outing"
convert2video bear "Bär Necessity"
convert2video baaa "Language Lesson"
convert2video lochness "Amazing Ducks"
convert2video venice "A Night in Venice"
convert2video hug "Hug the World"
convert2video arts "Tik\textit{Z}Art, yet again"
convert2video bees "Two Bees \linebreak or \linebreak Not Two Bees \par \normalsize\hfill \makebox[2.8cm][l]{Thanks\enspace to\enspace Marmot!\enspace \tikz[scale=0.3]\marmot;}"
convert2video downunder "Down Under"
convert2video zoom "Modern Times"
convert2video xcoffins "For Insiders Only"
convert2video queen "The Magic Flute"
convert2video vampire "Sinister"
convert2video finale "Grand Finale"


repeatconvert title "../ulrike/intermission/extravaganza-titlepage.pdf" 100
repeatconvert credits "../ulrike/intermission/extravaganza-2020-credits.pdf" 175

