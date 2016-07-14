#!/bin/bash

# run radio prep script
. ./tx_prep_radio.sh

raspivid -n -hf -vf -ih -b 4000000 -w 1280 -h 720 -fps 49 -g 5 -pf high -t 999999999 -o - | sudo ./tx $fec_settings $tx_radio_interface
