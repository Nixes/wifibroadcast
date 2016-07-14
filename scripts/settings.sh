#!/bin/bash

# note, spacing in the variable declaration syntax is important, follow to the letter

# multiple interfaces may be listed here to enable diversity
rx_radio_interface="wlx7cdd907ebe01"
# if you have another radio, add it here
rx_radio2_interface=""

# only one interface may be listed here
tx_radio_interface="wlan0"

# this makes sure settings are the same between tx and rx
radio_channel="14"

radio_rate="24M"

# these are the command line arguments to be used for ./tx and ./rx
fec_settings="-b 8 -r 16 -f 1024"

# mjpeg is more bandwidth heavy, and so fec settings should be set lower
mjpeg_fec_settings="-b 8 -r 4 -f 1024"
