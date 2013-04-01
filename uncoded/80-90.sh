#/bin/bash
cd /home/serega/uncoded/80-90/

for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 1000k -vf scale=-1:576 -threads 1 -acodec libfaac -b:a 192k /home/serega/files/clips/80-90-s/"$i"
        /project/scripts/main.sh
done
