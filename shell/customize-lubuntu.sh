#!/bin/bash

set -e

#sudo sed -i 's/quiet splash/text/' /etc/default/grub
#sudo sed -i 's/#GRUB_TERMINAL/GRUB_TERMINAL/' /etc/default/grub
#sudo update-grub

cd ~/
rm -vr Documents Music Pictures Public Templates Videos
cd -

# Add config files
cp -v '.vimrc' ~/.vimrc
cp -v  'lxterminal.conf' ~/.config/lxterminal/lxterminal.conf

terminal='x-terminal-emulator --geometry=90x24'
sed -i "s/x-terminal-emulator/$terminal/" ~/.config/openbox/lubuntu-rc.xml 
openbox --reconfigure

#EOF
