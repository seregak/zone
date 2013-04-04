#!/bin/bash
rsync -r -a -v --delete /var/www/clipzone/clip free:/home/sergey.klimkin/files/clip
rsync -r -a -v --delete /var/www/clipzone/drive free:/home/sergey.klimkin/files/drive
rsync -r -a -v --delete /var/www/clipzone/lessons free:/home/sergey.klimkin/files/lessons
rsync -r -a -v --delete	/var/www/clipzone/caver free:/home/sergey.klimkin/files/caver
rsync -r -a -v --delete	/var/www/clipzone/mp3 free:/home/sergey.klimkin/files/mp3
rsync -v /home/serega/clip.sql.gz free:/home/sergey.klimkin/files
rsync -v /home/serega/clipzone.tgz free:/home/sergey.klimkin/files
