    #!/bin/bash

set -e

./customize-apt-packages.sh

#sudo sed -i 's/quiet splash/text/' /etc/default/grub
#sudo sed -i 's/#GRUB_TERMINAL/GRUB_TERMINAL/' /etc/default/grub
#sudo update-grub

cd ~/
rm -vr Documents Music Pictures Public Templates Videos
cd -

# Add config files
cp -v ./conf/.vimrc ~/.vimrc
cp -v  ./conf/lxterminal.conf ~/.config/lxterminal/lxterminal.conf

x_terminal_emulator='x-terminal-emulator --geometry=90x24'
sed -i "s/x-terminal-emulator/$x_terminal_emulator/" ~/.config/openbox/lubuntu-rc.xml 
openbox --reconfigure

#EOF
