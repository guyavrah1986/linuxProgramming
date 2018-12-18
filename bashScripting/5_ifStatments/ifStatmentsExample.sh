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

# logical (boolean) and (&&) example
read -p "please enter a number:" num
if [ $num -gt 20 ] && [ $(($num % 2)) -eq 0 ]
then
	echo "number that was entered is even and greater than 20"
else
	echo "number that was entered is either NOT even OR NOT greater than 20"
fi

# logical (boolean) or (||) example
read -p "please enter your name" name
if [ $name = "Bob" ] || [ $name = "Alice" ]
then
	echo "hey there Bob or Alice"
else
	echo "I do not know you, cause you are not Bob nopt Alice"
fi

# case example
read -p "please enter the one of the three number:1,2 or 3:" num
case $num in
	1)
	echo "You entered $num"
	;;
	2)
	echo "You entered $num"
	;;
	3)
	echo "You entered $num"
	;;
	*)
	echo "Your input is invalid!!"
	;;
esac

echo "$0 - end"



