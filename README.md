# Linux-USB-WebCam
This project was started to capture an image and include it on a webpage
as webcam image using $3.00 USB camera I picked up at the flea market.
Additionally, I wanted to limit image capture to only daylight hours
based on the location sunrise and sunset.

The webcam and timelapse scripts are called from the root crontab and those entries are here:

#Capture WebCam Image Every five (5) minutes
*/5 5-20 * * * /usr/local/bin/web-cam.sh

#Create Timelapse mp4 file at 9:59PM
59 21 * * * /usr/local/bin/make-movie.sh

A couple of requirements for the webcam piece are:
wget
fswebcam (http://manpages.ubuntu.com/manpages/focal/man1/fswebcam.1.html)

The daylight determination feature is from
https://github.com/linuxconfig/Sunrise-Sunset-Shell-Script/blob/master/sunrise-sunset.sh

Requirements for the timelapse make movie script are:
ffmpeg (http://manpages.ubuntu.com/manpages/focal/en/man1/ffmpeg.1.html)
7zip (7z)

Sample site:
http://webcam.timbrown.us/

My locations are:
Apache2 Web directory: /var/www/webcam
Scripts are stored in /usr/local/bin

Also included is code to upload the webcam image to weatherunderground
via FTP, however they stopped taking images awhile back, but I left
the code should I need it again.
