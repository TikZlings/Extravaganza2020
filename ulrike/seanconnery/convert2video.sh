# clean up old video
rm seanconnery.mp4

# convert to png images
convert -density 240 seanconnery_combine.pdf seanconnery.png

# convert to video
ffmpeg -ss 00:00:00 -i seanconnery-%d.png -ss 00:01:18 -i NobodyDoesItBetter.m4a -shortest seanconnery_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i seanconnery_raw.mp4 -o seanconnery.mp4

# clean up
rm seanconnery-*.png
rm seanconnery_raw.mp4

# view :)
open seanconnery.mp4
