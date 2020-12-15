# clean up old video
rm venice.mp4

# convert to png images
convert -density 240 venice.pdf venice.png

# convert to video
ffmpeg  -ss 00:00:00 -i venice-%d.png \
        -ss 00:00:50 -i Barcarolle.m4a -shortest \
        -filter:a "volume=15" \
        venice_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i venice_raw.mp4 -o venice.mp4

# clean up
rm venice-*.png
rm venice_raw.mp4

# view :)
open venice.mp4
