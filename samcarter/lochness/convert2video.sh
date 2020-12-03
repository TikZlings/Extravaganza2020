# clean up old video
rm lochness.mp4

# convert to png images
convert -density 240 lochness.pdf lochness.png

# convert to video
ffmpeg -ss 00:00:00 -i lochness-%d.png -ss 00:00:55 -i AMAZINGGRACE.m4a -shortest lochness_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i lochness_raw.mp4 -o lochness.mp4

# clean up
rm lochness-*.png
rm lochness_raw.mp4

# view :)
open lochness.mp4
