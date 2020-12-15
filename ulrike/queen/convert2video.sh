# clean up old video
rm queen.mp4

# convert to png images
convert -density 240 queen_combine.pdf queen.png

# convert to video
ffmpeg -ss 00:00:00 -i queen-%d.png -ss 00:00:52 -i TheMagicFlute.m4a -shortest queen_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i queen_raw.mp4 -o queen.mp4

# clean up
rm queen-*.png
rm queen_raw.mp4

# view :)
open queen.mp4
