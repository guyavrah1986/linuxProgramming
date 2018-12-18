#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the concept of "variables expoprting". Another
# script will invoke this script and will pass it some variables, which
# are, offcourse, a copy of the variables from the invoking script.
# ----------------------------------------------------------------------
########################################################################

echo "$0 start"
echo "within $0, got var1 var3:$var1 $var3, var2:$var2"
var1=D.J
var3="La jente"
echo "within $0, NOW var1 var3:$var1 $var3"
echo "$0 end"
