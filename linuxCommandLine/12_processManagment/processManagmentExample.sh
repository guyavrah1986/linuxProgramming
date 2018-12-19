#!/bin/bash

########################################################################
# ----------------------------------------------------------------------
# This script illustrate the basic concept of process managment:
# ----------------------------------------------------------------------
########################################################################

echo "======================================="
echo "$0 - start"
echo "======================================="
echo ""
echo ""

currDir=$(pwd)
echo "currently we are at folder:$currDir"
echo "it contains the following items:"
ls 

# `top` will display the most CPU and/or memory consumption processes in the system
# along with all sort of detailes about them such as: user, VM usage, time running, command
# the second line is a summary about state of ALL processes currently in the system.
# top

# `ps` which stands for processes. In it's normal usage it will show you just the processes
# running in your current terminal (which is usually not very much). If we add the argument
# aux then it will show a complete system view which is a bit more helpful.
echo "list of processes running from within the current terminal:"
ps

echo ""
echo ""

echo "list of processes running in general within the system:"
ps -aux

echo ""
echo ""

# in case we wish (need) to force a process to quit (for instance, it is stuck), we
# can use the `kill` command with its PID

echo ""
echo ""

# in case the process still "lives", we can use the `kill` command again, this time
# with the -9 option which obligates the process to quit

echo ""
echo ""

# lets put the `sleep` command to "run" in the background 
# NOTE: the "new" (next) command line will prompt immdiately
echo "sending sleep to run in the background (i.e.- running: sleep 5 &)"
sleep 15 &
echo "to verify that we run `jobs` to view all processes running in the background"
jobs

echo ""
echo ""
 
# putting a process (job) into the "pause" mode can be done with the
# CTRL+Z combination. Then if we wish to bring it back to the foreground
# we use the command `fg` and the job number:

echo ""
echo ""
echo "======================================="
echo "$0 - end"
echo "======================================="
