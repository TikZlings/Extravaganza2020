# clean up old video
rm xcoffins.mp4

# convert to png images
convert -density 240 xcoffins.pdf xcoffins.png

# convert to video
ffmpeg -ss 00:00:00 -i xcoffins-%d.png -ss 00:00:00 -i ./assets/astronomia.mp3 -shortest xcoffins_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i xcoffins_raw.mp4 -o xcoffins.mp4

# clean up
rm xcoffins-*.png
rm xcoffins_raw.mp4

# view :)
open xcoffins.mp4
