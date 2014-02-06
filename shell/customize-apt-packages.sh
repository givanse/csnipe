#!/bin/bash

set -e

sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

sudo apt-get update

# REMOVE
packages='
abiword* ace-of-penguins audacious* 
blueman 
compiz* 
gnome-game* gnome-mplayer gnumeric* guvcview gwibber*
libreoffice* lubuntu-software-center
pidgin* 
simple-scan sylpheed*
thunderbird* 
update-manager 
xfburn xpad xterm
'
sudo apt-get --purge remove $packages

# INSTALL
packages='
git
openssh-client xchat
sublime-text-installer
ubuntuone-control-panel-qt 
vim 
'
sudo apt-get install $packages

#EOF
