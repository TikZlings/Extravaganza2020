# clean up old video
rm 007.mp4

# convert to png images
convert -density 240 007.pdf 007.png

# convert to video
ffmpeg  -ss 00:00:00 -i 007-%d.png -ss 00:00:20 -i TheManWithTheGoldenGun.m4a -shortest -filter:a "volume=15" 007_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i 007_raw.mp4 -o 007.mp4

# clean up
rm 007-*.png
rm 007_raw.mp4

# view :)
open 007.mp4
