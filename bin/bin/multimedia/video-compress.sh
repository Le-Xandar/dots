# compress all in directory!
for i in "$1"/*; do ffmpeg -i "$i"  -vcodec libx265 -crf 28 "compressed-${i%.*}.mp4"; done
