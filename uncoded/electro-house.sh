#/bin/bash
cd /home/serega/uncoded/electro-house/
for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 850k -vf scale=1024:576 -threads 1 -acodec libmp3lame -b:a 192k /home/serega/files/clips/electro-house/"$i"
        /project/scripts/zone/main.sh
done
