#!/bin/bash
. ./settings.sh

# reset tx radio
ifconfig $tx_radio_interface down
iwconfig $tx_radio_interface mode managed
ifconfig $tx_radio_interface up

# restart management of interface
ifplugd
