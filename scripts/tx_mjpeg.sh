#!/bin/bash

. ./tx_prep_radio.sh

# bitrate should be over 10000000 to get something reasonable
raspivid -n -hf -vf -cd MJPEG -b 13000000 -w 1280 -h 720 -fps 49 -t 999999999 -o - | sudo ./tx $mjpeg_fec_settings $tx_radio_interface
