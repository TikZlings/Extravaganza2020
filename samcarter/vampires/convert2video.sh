# clean up old video
rm vampires.mp4

# convert to png images
convert -density 240 vampires_combine.pdf vampires.png

# convert to video
ffmpeg -ss 00:00:00 -i vampires-%d.png -ss 00:01:40 -i Eternity.m4a -shortest -filter:a "volume=15" vampires_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i vampires_raw.mp4 -o vampires.mp4

# clean up
rm vampires-*.png
rm vampires_raw.mp4

# view :)
open vampires.mp4
