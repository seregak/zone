#!/bin/bash
cd /home/serega/files/
#files=`ls | awk '{print substr($0,1,length($0)-4)}'`
#files=`cat /project/scripts/last_files.csv | awk '{print substr($0,1,length($0)-4)}'`
while read j;
do
	i=`echo -n "$j" | awk '{print substr($0,1,length($0)-4)}'`
	echo $i
	ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
	convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
	ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
	mv "$i.jpg" /var/www/clipzone/caver
	mv "$i.mp3" /var/www/clipzone/mp3
	mv "$i.mp4" /var/www/clipzone/clip
done < /project/scripts/last_files.csv

#mv *.jpg /var/www/clipzone/caver
#mv *.mp3 /var/www/clipzone/mp3
#mv *.mp4 /var/www/clipzone/clip
