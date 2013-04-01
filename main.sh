#!/bin/bash
cd /home/serega/files

#load content to site
php /project/scripts/content_loader.php --src `pwd`

cd /home/serega/files/clips/80-90-s
shopt -s nullglob
for NAME in *
do
	echo $NAME
	TRS=`php /project/scripts/transliterate.php -s "$NAME"`
	if [[ `file -b "$NAME"` == directory ]]; then
	mv -v "$NAME" "$TRS"
	cd "$TRS"
	"$0"
	cd ..
	else
	mv -v "$NAME" "$TRS"
	fi

	i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/disco
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/electro-house
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/lounge
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/ost
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/pop
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/rap
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/rnb
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/rock
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/trance
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done

cd /home/serega/files/clips/uncensored
shopt -s nullglob
for NAME in *
do
        echo $NAME
        TRS=`php /project/scripts/transliterate.php -s "$NAME"`
        if [[ `file -b "$NAME"` == directory ]]; then
        mv -v "$NAME" "$TRS"
        cd "$TRS"
        "$0"
        cd ..
        else
        mv -v "$NAME" "$TRS"
        fi

        i=`echo -n "$TRS" | awk '{print substr($0,1,length($0)-4)}'`
        echo $i
        ffmpeg -i "$i.mp4" -r 1 -ss 00:00:30.000 -vframes 1 -t 1 "$i.jpg"
        convert "$i.jpg"    -resize 250x141\!  "$i.jpg"
        ffmpeg -i "$i.mp4" -vn -acodec libmp3lame -ab 192k -f mp3 "$i.mp3"
        mv "$i.jpg" /var/www/clipzone/caver
        mv "$i.mp3" /var/www/clipzone/mp3
        mv "$i.mp4" /var/www/clipzone/clip
done
