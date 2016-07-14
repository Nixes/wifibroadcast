# run radio prep script
. ./tx_prep_radio.sh

# set v4l output format
v4l2-ctl -p 49
v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=H264
# set bitrate
v4l2-ctl --set-ctrl video_bitrate=5000000
# start stream
v4l2-ctl --stream-mmap=3 --stream-count=99999999 --stream-to=/dev/stdout | sudo ./tx $fec_settings $tx_radio_interface

# bitrate should be over 10000000 to get something reasonable
# ffmpeg -f video4linux2 -i /dev/video0 -r 30 -s 1280x720 -f mjpeg -qscale 5 - | sudo ./tx -b 8 -r 16 -f 1024 wlan0
