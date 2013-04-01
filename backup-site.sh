#!/bin/bash
## backup faylov sayta
cd /home/serega
tar -czvf clipzone.tgz /var/www/clipzone/ --exclude "/var/www/clipzone/clip"  --exclude "/var/www/clipzone/drive"  --exclude "/var/www/clipzone/lessons"  --exclude "/var/www/clipzone/caver"  --exclude "/var/www/clipzone/mp3"

## backup bd
mysqldump -uroot -pcthtufghbdtn clip |gzip > /home/serega/clip.sql.gz
