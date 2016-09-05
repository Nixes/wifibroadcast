#Introduction
This project allows durable low latency transmission of HD video using off the shelf hardware.

A good explanation of the how and why is available from the original author befinitiv [here](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/)

This repository is just the source code along with some random notes gathered from forums, useful builds are found elsewhere. This repository was created to make a centralised source of documentation in the form of the wiki, and to allow use of GitHub’s issue tracker.

Forked from [bitbucket](https://bitbucket.org/befi/wifibroadcast) on 01/06/2016.

Original setup instructions [found here](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/wifibroadcast-fpv-manual-setup/)

#Other resources from around github
- [An OSD for wifibroadcast](https://github.com/SamuelBrucksch/wifibroadcast_osd)
- [Additional patches to improve wifibroadcast](https://github.com/bortek/EZ-WifiBroadcast)
- [Misc WifiBroadcast Utilities](https://github.com/skullkey/wbc-utils)

#Usage
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


#Latency
Lowest actually (repeatably) obtained by me: 128ms 

Expected latency: 110-150ms, depending on video quality

Break down of latency composition:
- 40ms Image Acquisition (buffering 2 frames?)
- 10ms Frame Encode (h.264) 
- 10ms Wi-Fi + FEC
- Reception + FEC Decoding + Display: Remaining ~50-100ms 

For comparison even some nice analog FPV cameras that use the Sony Effio chip have similar latencies. Except this is HD and has much better quality!

#[Experimental Log (including latency measurements)](https://gist.github.com/Nixes/053745dbbfb602f376d4f3015b15511a)

#Hardware Requirements
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

#Compatible (tx/rx) Wi-Fi adaptors

Anything [Ralink RT5572](https://wikidevi.com/wiki/Ralink_RT5572) without patches

Currently anything AR9271 based with patches:
 - [Alfa AWUS051NH](https://wikidevi.com/wiki/ALFA_Network_AWUS051NH)

Feel free to try whatever you have and file an issue if you find something that works but is not listed.

#Compatible receiving Wi-Fi adaptors:

Listed are adaptors that have been tested to run in monitor mode at the bitrates required, but have not been tested as transmitters:
