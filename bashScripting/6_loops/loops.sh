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

# example of for loop
nameNum=1
namesList="Guy Roei Rotem Kalter"
echo "The following names are:"
for var in $namesList
do
	echo "$nameNum) $var"
	((nameNum++))
done

echo "========================================="
echo "$0 - end"
echo "========================================="


