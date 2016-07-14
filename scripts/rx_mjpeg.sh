#!/bin/bash

. ./rx_prep_radio.sh

# need a smaller amount of fec packets to make space for the higher min bandwidth requirements, used autovideosink
./rx $mjpeg_fec_settings $rx_radio_interface $rx_radio2_interface | gst-launch-1.0 -v fdsrc ! jpegdec ! glimagesink sync=false
