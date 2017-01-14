#!/bin/bash

. ./settings.sh

# restart management of interface
ifplugd
NetworkManager

# reset main rx radio
ifconfig $rx_radio_interface down
iwconfig $rx_radio_interface mode managed
ifconfig $rx_radio_interface up


# if there is a second radio specified, then reset this other radio too
if [ ! -z "$rx_radio2_interface" ]; then
  ifconfig $rx_radio2_interface down
  iwconfig $rx_radio2_interface mode managed
  ifconfig $rx_radio2_interface up
fi
