#Intro
This is just the source code along with some random notes gathered from forums, usefull builds are found elsewhere. This repository was created to make a centralised source of documentation in the form of the wiki, and to allow use of githubs issue tracker.

Original setup instructions [found here](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/wifibroadcast-fpv-manual-setup/)

#Other resources
- [An OSD for wifibroadcast](https://github.com/SamuelBrucksch/wifibroadcast_osd)
- [Additional patches to improve wifibroadcast](https://github.com/bortek/EZ-WifiBroadcast)
- [Misc WifiBroadcast Utilities](https://github.com/skullkey/wbc-utils)


# wifibroadcast
An unofficial github fork of the project of the same name, from https://bitbucket.org/befi/wifibroadcast on 01/06/2016.

This project allows durable low latency transmission of hd video using off the shelf hardware.


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

settings including wifi device names are modified in settings.sh


#Latency
Lowest actually (repeatably) obtained by me: 128ms 

Expected latency: 110-150ms, depending on video quality

Break down of latency composition:
- 40ms Image Acquisition (buffering 2 frames?)
- 10ms Frame Encode (h.264) 
- 10ms Wifi + FEC
- Reception+FEC-Decoding+Display: Remaining ~50-100ms 

For comparison even some nice analog fpv cameras that use the Sony Effio chip have similar latencies. Except this is HD and has much better quality!

#[Experimental Log (including latency measurements)](https://gist.github.com/Nixes/053745dbbfb602f376d4f3015b15511a)

#Hardware Requirements
Transmitter
- Raspberry Pi (Zero 1.3, A/A+, B/B+, B2)
- Raspberry Camera
- compatable wifi adaptor

Receiver 
- Raspberry (Zero, A/A+, B/B+, B2)
- compatable wifi adaptor

or (even better)

- Any linux device with enough compute to software decode h264 or mjpeg in mplayer or ffplay
- A wifi adaptor that supports monitor mode fast enough
- Multiple compatible wifi adaptors to use for diversity reception

[potentially android?](https://github.com/Consti10/myMediaCodecPlayer-for-FPV)

#Compatable (tx/rx) wifi adaptors

Anything [Ralink RT5572](https://wikidevi.com/wiki/Ralink_RT5572) without patches

Currently anything AR9271 based with patches:
 - [Alfa AWUS051NH](https://wikidevi.com/wiki/ALFA_Network_AWUS051NH)

Feel free to try whatever you have and file an issue if you find something that works but is not listed.

#Compatable rx wifi adaptors:

Adaptors that have been tested to run in monitor mode at the bitrates required, but have not been tested as transmitters:
