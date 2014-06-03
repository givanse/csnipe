#!/bin/bash

set -e

#
# Remove default folders in ~/
#
cd ~/
rm -vr Documents Music Pictures Public Templates Videos
cd -

#
# Install configuration files from conf/
#
cp -v ./conf/.vimrc ~/.vimrc
cp -v  ./conf/lxterminal.conf ~/.config/lxterminal/lxterminal.conf
#TODO ./conf/install-config-files.sh

#
# Configure Openbox
#
term_manag_cmd='terminal_manager/command='
x_terminal_emulator="x-terminal-emulator --geometry=135x35 --command='/bin/bash -il'"
sed -i "s/^$term_manag_cmd.*$/$term_manag_cmd$x_terminal_emulator/" ~/.config/lxsession/Lubuntu/desktop.conf
openbox --reconfigure

#
# Configure git
#
git config --global user.name givanse
git config --global user.mail foobar@mail.com
git config --global core.editor 'vim'
git config --global -e

xset s off

exit
#EOF
