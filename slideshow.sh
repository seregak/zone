#/bin/bash
cd /home/serega/clipzone/slideshow/
for i in *;
do
ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
done

