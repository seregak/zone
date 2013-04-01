#/bin/bash
cd /home/serega/uncoded/ost/
for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 1000k -vf scale=-1:576 -threads 1 -acodec libfaac -b:a 192k /home/serega/files/clips/ost/"$i"
        /project/scripts/main.sh
done
