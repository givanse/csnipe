#!/bin/bash

set -e

# The directory where the files will be copied to.
destDir=${PWD}
echo -e 'Config files will be copied to: \n    '$destDir'\n'

declare -a files_list=(
~/.vimrc 
~/.config/lxterminal/lxterminal.conf 
~/.bash_aliases 
~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
); 

echo 'Copying...'
for file_path in "${files_list[@]}"
do
    # Wrap $destDir with double quotes so that the string will be escaped.
    cp -v $file_path "$destDir"
done

echo -e '\nDone, current files list:'
ls -la "$destDir"

#EOF
