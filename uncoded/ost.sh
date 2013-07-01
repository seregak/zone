#/bin/bash
cd /home/serega/uncoded/ost/
for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 850k -vf scale=-1:576 -threads 1 -acodec libmp3lame -b:a 192k /home/serega/files/clips/ost/"$i"
        /project/scripts/zone/main.sh
done
