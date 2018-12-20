#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of the conditional
# statmemnts (i.e.- if statments):
# ----------------------------------------------------------------------
########################################################################

echo "========================================="
echo "$0 - start"
echo "========================================="

# Note that within the loop we used the `((counter))` to "self update"
# the value of the counter variable.
num=10
counter=1
echo "demonstration of a while loop - let's count untill $num"
while [ $counter -le $num ]	# le - less than OR equal
do
	echo "$counter"
	((counter++))
done

echo ""
echo ""

# example of for loop
nameNum=1
namesList="Guy Roei Rotem Kalter"
echo "The following names are:"
for var in $namesList
do
	echo "$nameNum) $var"
	((nameNum++))
done

echo ""
echo ""

# basic ragne loop
for val in {1..5}
do 
	echo "$val"
done

echo ""
echo ""

# range loop that skips every two numbers
for val in {2..10..2}
do 
	echo "$val"
done

echo ""
echo ""

# usage of the break keyword
read -p "please enter 3 numbers (denoted by single space between them):" numbers
echo "you have entered:$numbers"

# go over the numbers and if one of them is NOT even - break the loop
counter=1
for num in $numbers
do
	echo "number $counter):$num"
	((counter++))
	if [ ! $(($num % 2)) -eq 0 ]
	then
		echo "encountered an ODD number, terminating loop"		
		break
	fi
done

echo ""
echo ""


echo "========================================="
echo "$0 - end"
echo "========================================="


