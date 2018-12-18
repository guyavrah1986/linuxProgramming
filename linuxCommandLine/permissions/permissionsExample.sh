#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept and usage of file and folders
# permissions:
# ----------------------------------------------------------------------
########################################################################

echo "$0 - start"

echo "$0 - current folder contains the follolwing items (note the permissions oif each one):"
echo "============================================================================================"
ls -l

# Just for illustration: remove (-) the write (w) permission for the group & all (ga) users for the given file
fileName=abcc
chmod ga-w $fileName
ls -l

# add (+) the write (w) permission for the group & all (ga) users for the given file
fileName=abcc
chmod ga+w $fileName
ls -l

# Just for illustration: remove (-) the execute (x) permission for the current user (u) given folder (i.e.- we will 
# NOT be able to navigate to this folder)
folderName=folder1
chmod u+x $folderName
cd $folderName
pwd 

echo "$0 - end"
