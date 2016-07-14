#!/bin/bash

# run radio prep script
. ./tx_prep_radio.sh

# set v4l output format
v4l2-ctl -p 49
v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=MJPEG
# set bitrate 13000000
#v4l2-ctl --set-ctrl video_bitrate=13000000
# bitrate setting does not seem to work properly
v4l2-ctl --set-ctrl compression_quality=10

# start stream
v4l2-ctl --stream-mmap=3  --stream-to=/dev/stdout | sudo ./tx $mjpeg_fec_settings $tx_radio_interface

# bitrate should be over 10000000 to get something reasonable
# ffmpeg -f video4linux2 -i /dev/video0 -r 30 -s 1280x720 -f mjpeg -qscale 5 - | sudo ./tx -b 8 -r 16 -f 1024 wlan0
