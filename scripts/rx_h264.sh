# this dot space notation works like an include
. ./rx_radio_prep.sh

./rx $fec_settings $rx_radio_interface | gst-launch-1.0 -v fdsrc ! h264parse ! avdec_h264 ! glimagesink sync=false
