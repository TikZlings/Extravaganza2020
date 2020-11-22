# clean up old video
rm honey.mp4

# convert to png images
convert -density 160 honey.pdf honey.png

# convert to video
ffmpeg -ss 00:00:00 -i honey-%d.png -ss 00:00:05 -i ABBA.m4a -shortest honey_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i honey_raw.mp4 -o honey.mp4

# clean up
rm honey-*.png
rm honey_raw.mp4

# view :)
open honey.mp4
