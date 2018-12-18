#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the concept of user input of/for a bash script:
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"

# ask the user to insert input "silently"
read -p "User name:" userName
read -sp "Password:" password

echo "$0 - user name:$userName, password:$password"

read -p "enter 4 words:" var1 var2 var3
echo "$0 - var1: $var1, var2:$var2 var3:$var3"

read -p "enter 2 words:" var1 var2 var3
echo "$0 - var1: $var1, var2:$var2 var3:$var3" 






