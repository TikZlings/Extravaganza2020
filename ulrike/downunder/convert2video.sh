# clean up old video
rm downunder.mp4

# convert to png images
convert -density 240 downunder.pdf downunder.png

# convert to video
ffmpeg -ss 00:00:00 -i downunder-%d.png -ss 00:01:01 -i SlimDusty.m4a -shortest downunder_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i downunder_raw.mp4 -o downunder.mp4

# clean up
rm downunder-*.png
rm downunder_raw.mp4

# view :)
open downunder.mp4
