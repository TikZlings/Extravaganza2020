# clean up old video
rm tikzlings-meeting.mp4

# convert to png images
convert -density 240 tikzlings-meeting.pdf tikzlings-meeting.png

# convert to video
ffmpeg -ss 00:00:00 -i tikzlings-meeting-%d.png -ss 00:00:00 -i FunnyMusicForVideos.m4a -shortest tikzlings-meeting_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i tikzlings-meeting_raw.mp4 -o tikzlings-meeting.mp4

# clean up
rm tikzlings-meeting-*.png
rm tikzlings-meeting_raw.mp4

# view :)
open tikzlings-meeting.mp4
