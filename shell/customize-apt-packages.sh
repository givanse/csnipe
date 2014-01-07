#!/bin/bash

set -e

sudo apt-get update

# REMOVE
web='thunderbird* gwibber* pidgin* sylpheed*'
games='ace-of-penguins gnome-game*'
office='libreoffice* abiword* gnumeric* simple-scan xpad'
media='audacious* gnome-mplayer xfburn guvcview'
other='compiz* blueman update-manager lubuntu-software-center'
sudo apt-get --purge remove $web $games $office $media $other 

# INSTALL
apps='ubuntuone-control-panel-qt vim'
connectivity='openssh-client'
sudo apt-get install $connectivity $apps 

#EOF
