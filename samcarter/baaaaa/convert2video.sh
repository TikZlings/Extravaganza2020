# clean up old video
rm baaaaa.mp4

# convert to png images
convert -density 240 baaaaa.pdf baaaaa.png

## convert to video
ffmpeg -ss 00:00:00 -i baaaaa-%d.png \
       -ss 00:00:00 -i sheep.mp3 \
       baaaaa_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i baaaaa_raw.mp4 -o baaaaa.mp4

# clean up
rm baaaaa-*.png
rm baaaaa_raw.mp4

# view :)
open baaaaa.mp4
