# clean up old video
rm bobble.mp4

# convert to png images
convert -density 240 bobble_combine.pdf bobble.png

# convert to video
ffmpeg -ss 00:00:00 -i bobble-%d.png -ss 00:00:52 -i Tannenbaum.m4a -shortest bobble_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i bobble_raw.mp4 -o bobble.mp4

# clean up
rm bobble-*.png
rm bobble_raw.mp4

# view :)
open bobble.mp4
