#!/bin/bash
TS=$(date +"%Y-%m-%d")

cd /var/www/webcam
#ls -1 $TS* | head -1 | xargs rm -f

#ffmpeg -framerate 6 -pattern_type glob -i $TS'*.jpg' -c:v libx264 -pix_fmt yuv480p /var/www/webcam/timelapse/$TS.mp4
ffmpeg -framerate 4 -pattern_type glob -i $TS'*.jpg' -c:v libx264 -pix_fmt yuv420p /var/www/webcam/timelapse/$TS.mp4

7z a $TS.7z $TS'*.jpg'

rm -f $TS*'.jpg'
