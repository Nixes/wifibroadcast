# Introduction
This project allows durable low latency transmission of HD video using off the shelf hardware.

A good explanation of the how and why is available from the original author befinitiv [here](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/)

This repository is just the source code along with some random notes gathered from forums, and was created to make a centralised source of documentation in the form of the wiki, and to allow use of GitHub’s issue tracker.

Forked from [bitbucket](https://bitbucket.org/befi/wifibroadcast) on 01/06/2016.

Original setup instructions [found here](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/wifibroadcast-fpv-manual-setup/)

# Other resources from around github
- [An OSD for wifibroadcast](https://github.com/SamuelBrucksch/wifibroadcast_osd)
- [Additional patches to improve wifibroadcast](https://github.com/bortek/EZ-WifiBroadcast)
- [Misc WifiBroadcast Utilities](https://github.com/skullkey/wbc-utils)

# Usage
download and compile with
```
apt-get install git libpcap-dev iw
git clone https://github.com/Nixes/wifibroadcast.git
cd wifibroadcast
make
```
run using scripts in /scripts folder

eg if you want h264 run on the transmitter
```
sudo ./tx_h264.sh
```
and on the receiver
```
sudo ./rx_h264_mplayer.sh
```

settings including Wi-Fi device names are modified in settings.sh


# Latency
Lowest actually (repeatably) obtained by me: 128ms 

For comparison even some nice analog FPV cameras that use the Sony Effio chip have similar latencies. Except this is HD and has much better quality!

# [Experimental Log (including latency measurements)](https://gist.github.com/Nixes/053745dbbfb602f376d4f3015b15511a)

# Hardware Requirements
Transmitter
- Raspberry Pi (Zero 1.3, A/A+, B/B+, B2)
- Raspberry Camera
- compatible Wi-Fi adaptor

Receiver 
- Raspberry (Zero, A/A+, B/B+, B2)
- compatible Wi-Fi adaptor

or (even better)

- Any Linux device with enough compute to software decode h264 or mjpeg in mplayer or ffplay
- A Wi-Fi adaptor that supports monitor mode fast enough
- Multiple compatible Wi-Fi adaptors to use for diversity reception

[potentially android?](https://github.com/Consti10/myMediaCodecPlayer-for-FPV)

# Compatible (tx/rx) Wi-Fi adaptors
Are found in [this list](https://github.com/Nixes/wifibroadcast/wiki/Wifi-Hardware) on the wiki

Note this wiki is publicly editable, feel free to add your own experiences with wifi dongles here.
