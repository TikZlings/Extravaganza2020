# clean up old video
rm bees.mp4

# convert to png images
convert -density 240 bees.pdf bees.png

# convert to video
ffmpeg  -ss 00:00:00 -i bees-%d.png \
        -ss 00:00:00 -itsoffset 00:00:04 -to 00:00:14 -i Hamlet.m4a \
        -filter:a "volume=15" \
        bees_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i bees_raw.mp4 -o bees.mp4

# clean up
rm bees-*.png
rm bees_raw.mp4

# view :)
open bees.mp4
