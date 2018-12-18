#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of the conditional
# statmemnts (i.e.- if statments):
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"

var1=9
var2=009

# note the difference between the `=` sign and the -eq usage:
# = checks character wise equality
# -eq checks numerically equality
if [ $var1 = $var2 ]
then
	echo "$var1 = $var2"
fi

if [ $var1 -eq $var2 ]
then
	echo "$var1 -eq $var2"
fi

# if we got a file name as the first (and onl;y) command line argument then use it,
# otherwise use the /dev/stdin file
if [ $# -eq 1 ]
then
	echo "we got file name:$1"
	nl $1
else
	echo "we did not get any file as an input for this script, use /dev/stdin instead"
	nl /dev/stdin
fi

# if-elseif-else example
read -p "Please enter your age" age
if [ $age -gt 18 ]
then 
	echo "You are above 18, you may go to the part"
elif [ $age -gt 15 ]
then
	echo "You are at the range 18-15, you can go to the party, but be back by midnight"
else
	echo "You can not go to the party"
fi 


echo "$0 - end"
