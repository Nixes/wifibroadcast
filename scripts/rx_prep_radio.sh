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

iwconfig $rx_radio_interface rate $radio_rate

# if there is a second radio specified, then prepare this other radio too
if [ ! -z "$rx_radio2_interface"]; then
  ifconfig $rx_radio2_interface down
  iw dev $rx_radio2_interface set monitor otherbss fcsfail

  ifconfig $rx_radio2_interface up
  iwconfig $rx_radio2_interface channel $radio_channel

  iwconfig $rx_radio2_interface rate $radio_rate
fi
