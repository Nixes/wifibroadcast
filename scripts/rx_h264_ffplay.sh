# this dot space notation works like an include
. ./rx_prep_radio.sh

./rx $fec_settings $rx_radio_interface | ffplay -fflags nobuffer
