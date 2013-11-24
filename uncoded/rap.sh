#/bin/bash
cd /home/serega/uncoded/rap/

for i in *
do
        ffmpeg -i "$i" -vcodec libx264 -movflags faststart -vprofile high -preset slower -b:v 850k -vf scale=1024:576 -threads 0 -acodec libmp3lame -b:a 192k /home/serega/files/clips/rap/"$i"
	/project/scripts/zone/main.sh
done

