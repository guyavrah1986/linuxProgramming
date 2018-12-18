#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of arithemtic
# operations within bash scripts:
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"

# use `let` with spaces (so we keep it within double quotes)
let "a = 5 + 4"
echo "a is:$a"

# use `let` without spaces (so we do not have to keep it within double quotes)
# also note the usage of a variable within the expression
let b=$a*2
echo "b is:$b"

# increment operator
let b++
echo "after performing b++, b is now:$b"

# decrement operator
let b--
echo "after performing b--, b is now:$b"

# use the `expr` command
echo "result of 4 + 3 is:"
expr 4 + 3

# use the double paranthesses along wihe `$` sign to get (and set) the "value" of an (arithemetic) expression
res1=$((4 + 8))
echo "res1 is:$res1"

echo "b is:$b"
res1=$(($b + 5))
echo "(($b + 5)) is:$res1"

# get the length of a variable (how many characters its value is composed of:
var1='Hello World!!'
echo "var1 which is:$var1 composed of ${#var1} characters"

echo "$0 - end"
