#!/bin/bash

# this dot space notation works like an include
. ./rx_prep_radio.sh

./rx $fec_settings $rx_radio_interface $rx_radio2_interface | mplayer -fps 200 -demuxer h264es -nocache -
