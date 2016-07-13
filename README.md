# wifibroadcast
An unofficial github mirror of the project of the same name, from https://bitbucket.org/befi/wifibroadcast on 01/06/2016.
This project allows durable low latency transmission of hd video using off the shelf hardware.


##[Experimental Log](https://gist.github.com/Nixes/053745dbbfb602f376d4f3015b15511a)

All this is possible due to the amazing work of [befinitiv](https://befinitiv.wordpress.com/)

This is just the source code along with some random notes gathered from forums, usefull builds are found elsewhere. This repository was created to make a centralised source of documentation in the form of the wiki, and to allow use of githubs issue tracker.

Setup instructions here: https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/wifibroadcast-fpv-manual-setup/

Lowest actually (repeatably) obtained by me: 128ms 

Expected latency: 80-150ms, depending on video quality

Break down of latency composition:
- 40ms Image Acquisition (buffering 2 frames?)
- 10ms Frame Encode (h.264) 
- 10ms Wifi + FEC?
- Decode (FEC-Encoding+Transmission+Reception+FEC-Decoding+Display: Remaining ~50-100ms (to be confirmed))?


#Hardware Requirements
Transmitter
- Raspberry Pi (A/A+, B/B+, B2)
- Raspberry Camera
- compatable wifi adaptor

Receiver 
- Raspberry (Zero, A/A+, B/B+, B2)
- compatable wifi adaptor

or (even better)

- Any linux device with enough compute to software decode h264 or mjpeg in mplayer or ffplay
- A wifi adaptor that supports monitor mode fast enough

[potentially android?](https://github.com/Consti10/myMediaCodecPlayer-for-FPV)

#Compatable (tx/rx) wifi adaptors
Anything [Ralink RT5572](https://wikidevi.com/wiki/Ralink_RT5572) without patches

Currently anything AR9271 based with patches:
 - [Alfa AWUS051NH](https://wikidevi.com/wiki/ALFA_Network_AWUS051NH)

Feel free to try whatever you have and file an issue if you find something that works but is not listed.

#Compatable rx wifi adaptors:

Adaptors that have been tested to run in monitor mode at the bitrates required, but have not been tested as transmitters:
