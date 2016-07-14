#!/bin/bash

# this dot space notation works like an include
. ./rx_prep_radio.sh

./rx -b 8 -r 4 -f 1024 $rx_radio_interface | mplayer -fps 200 -demuxer lavf -nocache -
