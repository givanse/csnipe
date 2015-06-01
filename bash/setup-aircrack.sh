#!/bin/bash

set -e

# ld: cannot find -lz
# apt-file search libz.so

sudo apt-get install zlib1g-dev libgcrypt-dev libsqlite3-dev make iw

sudo make uninstall

echo ' > Compile'
make gcrypt=true sqllite=true

make strip

sudo make install

echo 'Install/update OUI file:'
sudo airodump-ng-oui-update

#EOF
