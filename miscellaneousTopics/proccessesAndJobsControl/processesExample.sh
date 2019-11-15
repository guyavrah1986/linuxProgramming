#!/bin/bash

#===============================================================================================================================
#===============================================================================================================================
# constants
# --------
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#===============================================================================================================================
#===============================================================================================================================
script_name=$0

echo "${green}===============================${reset}"
echo "${script_name} - start"
echo "${green}===============================${reset}"

currDir=$(pwd)
echo "current working directory is:$currDir"
background_process_script_name="simpleBackgroundProcess.sh"
echo "${blue}${script_name} - about to start script:${background_process_script_name} in the background${reset}"

# this command will lunch the provided script in the background, making it:
# - Within this shell session.
# - Within this process group.
# - Its output will NOT be displayed in the "running shell", thus it will NOT "block" the prompt of the running shell.
./${background_process_script_name} > /dev/null 2>&1 &
echo "${blue}${script_name} - displaying all jobs in this shell session:${reset}"
jobs

# when starting a new "job", fir example by running  a certain script, two things (numbers) are displayed right after
# the job started to run:
# [1] 3244
# [1] - is the job number.
# 3244 - is the PID (process ID) of this job.
echo "${green}===============================${reset}"
echo "${script_name} - end"
echo "${green}===============================${reset}"


