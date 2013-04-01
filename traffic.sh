#!/bin/bash
NOW=$(date +"%F")
BAK="/var/log/reports/traffic/$NOW"
vnstat -d > $BAK.log



