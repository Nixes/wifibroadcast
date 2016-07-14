. ./settings.sh

# stop management of interface
killall ifplugd

ifconfig $tx_radio_interface down


iw dev $tx_radio_interface set monitor otherbss fcsfail

iw reg set BO # required for more tx power

# required for using channel 14
if [ "$radio_channel" == "14" ]; then
  iw reg set JP
fi

iwconfig $tx_radio_interface txpower 20


ifconfig $tx_radio_interface up

iwconfig $tx_radio_interface channel $radio_channel
iwconfig $tx_radio_interface rate 54M # sets modulation, only works on some dongles 24M works well
