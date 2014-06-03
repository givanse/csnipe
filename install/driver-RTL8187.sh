#!/bin/bash

#http://www.realtek.com.tw/downloads/searchView.aspx?keyword=rtl8187
# dowload driver

#http://www.aircrack-ng.org/doku.php?id=rtl8187
#  download patch, improves injection speed
wget http://patches.aircrack-ng.org/mac80211-2.6.29-fix-tx-ctl-no-ack-retry-count.patch

#http://www.aircrack-ng.org/doku.php?id=patching
mv mac80211-2.6.29-fix-tx-ctl-no-ack-retry-count.patch 

sudo modprobe -r r8187
echo blacklist r8187 | sudo tee -a /etc/modprobe.d/blacklist.conf

# injection test
# http://www.aircrack-ng.org/doku.php?id=injection_test
sudo airmon-ng start wlan1
# had to turn off wifi connection (stop all the monX interfaces also?)
# wlan1 supports monitor mode?
sudo aireplay-ng --test -i mon0 wlan0

# capture packets
sudo airodump-ng -c 6 --bssid 00:1E:E5:48:14:17 -w dump wlan0
# test injection works
sudo aireplay-ng --fakeauth 0 -e "Name" -a 00:1E:E5:48:14:17 wlan0
# 


#EOF
