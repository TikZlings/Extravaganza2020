# clean up old video
rm hug-the-world.mp4

# convert to png images
convert -density 240 hug-the-world.pdf hug-the-world.png

# convert to video
ffmpeg -ss 00:00:00 -i hug-the-world-%d.png -ss 00:00:00 -i ./assets/hug-the-world-modified-silence.mp3 -shortest hug-the-world_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i hug-the-world_raw.mp4 -o hug-the-world.mp4

# clean up
rm hug-the-world-*.png
rm hug-the-world_raw.mp4

# view :)
open hug-the-world.mp4
