#!/bin/bash
NOW=$(date '+%Y/%m/%d')
# First obtain a location code from: https://weather.codes/search/

# Insert your location. For example LOXX0001 is a location code for Bratislava, Slovakia
location="USNC0107"
tmpfile=/tmp/$location.out

# Obtain sunrise and sunset raw data from weather.com
wget -q "https://weather.com/weather/today/l/$location" -O "$tmpfile"

SUNR=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
SUNS=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)

sunrise=$(date --date="$SUNR" +%R)
sunset=$(date --date="$SUNS" +%R)

srts=${NOW}" "${sunrise}
ssts=${NOW}" "${sunset}
echo $ssts
epochsr=$(date "+%s" -d "$srts")
epochss=$(date "+%s" -d "$ssts")

if  [[ $EPOCHSECONDS -ge $epochsr && $EPOCHSECONDS -le $epochss ]] ; then
	TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`

	fswebcam -r 1280x720 --jpeg 85 -D 4 -S 20 -F 10 /var/www/webcam/current.jpg
	cp /var/www/webcam/current.jpg /var/www/webcam/$TIMESTAMP.jpg

#Weatherunderground quit taking webcam images, but I leave this section in as reminder of how to do it.
#/usr/bin/ftp -pn webcam.wunderground.com << EOF
#quote USER <redacted>
#quote PASS <redacted>
#verbose
#binary
#cd "/"
#put /var/www/webcam/current.jpg image.jpg
#quit
#EOF
else
	echo "Skipping..."
fi
exit
