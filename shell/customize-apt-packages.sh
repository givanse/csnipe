#!/bin/bash

set -e

sudo apt-get update

# REMOVE
web='thunderbird* gwibber* pidgin* sylpheed*'
games='ace-of-penguins gnome-game*'
office='libreoffice* abiword* gnumeric* simple-scan xpad'
media='audacious* gnome-mplayer xfburn guvcview'
other='compiz* blueman update-manager lubuntu-software-center'
system_tools='xterm'
sudo apt-get --purge remove $web $games $office $media $other $system_tools 

# INSTALL
apps='ubuntuone-control-panel-qt vim'
connectivity='openssh-client xchat'
dev='git'
sudo apt-get install $connectivity $apps $dev

#EOF
