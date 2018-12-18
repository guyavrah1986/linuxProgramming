#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the concept of user input in the format of a 
# file that is provided to this script via the script's STDIN:
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"
echo "The names and numbers of the famous Sekzia players are:"
cat /dev/stdin | cut -d' ' -f 1,3 | sort

echo "$0 - end"
