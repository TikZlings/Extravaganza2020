# clean up old video
rm bees.mp4

# convert to png images
convert -density 240 bees.pdf bees.png

# convert to video
ffmpeg  -ss 00:00:00 -i bees-%d.png \
        -ss 00:00:00 -i bee.mp3 \
        bees_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i bees_raw.mp4 -o bees.mp4

# clean up
rm bees-*.png
rm bees_raw.mp4

# view :)
open bees.mp4
