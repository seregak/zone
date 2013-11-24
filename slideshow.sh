#/bin/bash
cd /home/serega/clipzone/slideshow/
LIST=`ls | awk '{print substr($0,1,length($0)-4)}'`
for i in $LIST;
do
ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
convert "$i.jpg"    -resize 750x423\!  "$i.jpg"
done

mv *.jpg /var/www/clipzone/images/yootheme/demo/gallery/
rm -r /home/serega/clipzone/slideshow/*

