#!/bin/bash

set -e

# The directory where the files will be copied to.
destDir=${PWD}

echo -e 'Config files will be copied to: \n    '$destDir'\n'

echo 'Copying...'
# Wrap $destDir with double quotes so that the string will be escaped.
cp -v ~/.vimrc "$destDir"
cp -v ~/.config/lxterminal/lxterminal.conf "$destDir"
cp -v ~/.bash_aliases "$destDir"

echo -e '\nDone:'
ls -la "$destDir"

#EOF