#!/bin/bash

. ./settings.sh

# stop management of interface
killall ifplugd
killall NetworkManager
# there may be plenty more popular network managers, please pr if yours is not covered

ifconfig $rx_radio_interface down
iw dev $rx_radio_interface set monitor otherbss fcsfail

# required for using channel 14
if [ "$radio_channel" == "14" ]; then
  iw reg set JP
fi

ifconfig $rx_radio_interface up
iwconfig $rx_radio_interface channel $radio_channel

iwconfig $rx_radio_interface rate 54M
