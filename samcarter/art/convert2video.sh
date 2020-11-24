# clean up old video
rm art.mp4

# convert to png images
convert -density 160 art.pdf art.png

# convert to video
ffmpeg -ss 00:00:00 -i art-%d.png -ss 00:00:00 -i VermeerandMusic.m4a -shortest art_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i art_raw.mp4 -o art.mp4

# clean up
rm art-*.png
rm art_raw.mp4

# view :)
open art.mp4
