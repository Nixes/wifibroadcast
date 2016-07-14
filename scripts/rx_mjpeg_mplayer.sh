#!/bin/bash

# this dot space notation works like an include
. ./rx_prep_radio.sh

./rx $mjpeg_fec_settings $rx_radio_interface | mplayer -fps 200 -demuxer lavf -nocache -
