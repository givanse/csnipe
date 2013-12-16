#!/bin/bash

# Estimate disk usage and list it in ascending order
alias dus="du -h | grep -P '\d+\.\d+[MG]' | sort"

#EOF
