#/bin/bash
cd /home/serega/uncoded/80-90/

for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 850k -vf scale=1024:576 -threads 1 -acodec libmp3lame -b:a 192k /home/serega/files/clips/80-90-s/"$i"
        /project/scripts/zone/main.sh
done
