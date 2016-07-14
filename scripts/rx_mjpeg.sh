#!/bin/bash

. ./rx_prep_radio.sh

# need a smaller amount of fec packets to make space for the higher min bandwidth requirements, used autovideosink
./rx -b 8 -r 4 -f 1024 $rx_radio_interface | gst-launch-1.0 -v fdsrc ! jpegdec ! glimagesink sync=false
