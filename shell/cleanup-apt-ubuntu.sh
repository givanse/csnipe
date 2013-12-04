#!/bin/bash

# Fix and cleanup an Aptitude system

# Requirements: Aptitude, deborphan

# Warning: This script will remove old kernels.
#          If you have recently installed new kernels, run after a reboot.

set -e


sudo dpkg --configure -a

echo "> Fix broken"
sudo apt-get install --fix-broken

echo "> Remove old kernels"
# remove old kernels, and
curr_k_version=`uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/"`
sed_expr='/^ii/!d;/'$curr_k_version'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'
dpkg -l 'linux-*' | sed -e "$sed_expr" | xargs sudo apt-get -y remove --purge
# update grub
sudo update-grub2

echo "> Auto remove clean"
sudo apt-get autoremove
sudo apt-get autoclean

echo "> Orphaned"
# remove orphaned packages
sudo deborphan | xargs sudo apt-get -y remove --purge
# remove orphaned data packages
sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge

exit
#EOF
