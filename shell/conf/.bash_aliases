#!/bin/bash

alias srvm='source ~/.rvm/scripts/rvm'

# usage examples:
#     grepr some_text
#     grepr some_text folder/
alias grepr='grepr $1 $2'
function grepr() {
    term=$1
    folder=$2
    echo "grep -nR '$1' $2*"    
    grep -nR "$1" $2*
}

#EOF
