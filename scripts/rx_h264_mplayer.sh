# this dot space notation works like an include
. ./rx_radio_prep.sh

./rx -b 8 -r 16 -f 1024 $rx_radio_interface | mplayer -fps 200 -demuxer h264es -nocache -
