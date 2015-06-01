#!/bin/bash

# https://help.ubuntu.com/community/LightScribe
# download "system software" "simple labeler"

sudo apt-get install ia32-libs


sudo dpkg --install --force-architecture lightscribe-1.18.27.10-linux-2.6-intel.deb
sudo dpkg --install --force-architecture lightscribeApplications-1.18.15.1-linux-2.6-intel.deb

# add advanced labeling
# lightscribe labeler
# http://www.lacie.com/us/support/support_manifest.htm?id=10204
sudo apt-get install alien
mv "original name" lacie-lightscribe-labeler-1.0.rpm
sudo alien lacie-lightscribe-labeler-1.0.rpm

#EOF
