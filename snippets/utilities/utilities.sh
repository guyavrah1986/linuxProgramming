#!/bin/bash

##########################################################################################################################################################################
##########################################################################################################################################################################
# utilities
# ---------
# This file contains all sort of general purpose utilties functions that can be used in all sort of scenarios. 
#
#
##########################################################################################################################################################################
##########################################################################################################################################################################

# ===================================================================
#
# Constants:
# ---------
SUCCESS=0
ERROR=1

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#
# ===================================================================




# ===================================================================
# Message displaying:
# ------------------
#
# ===================================================================

<< ///
This function gets a string that should be outputed, and it outputs it
as an "error" (with RED color onto the STD - terminal).
ARG1 - message to be disaplyed as error message.
///
function displayError { 
	echo "${red} $1 ${reset}"
}


<< ///
This function gets a string that should be outputed, and it outputs it
as an "verbose" (with GREEN color onto the STD - terminal).
ARG1 - message to be disaplyed as error message.
///
function displayMessageInGreen {
	echo "${green} $1 ${reset}"
}


# ===================================================================
# Files and directories handling:
# -------------------------------
#
# ==================================================================

<< ///
This function revices file name to be created and creates it in the current working directory (i.e.- "." folder).
Anyways, it creates a file with the given name in the current working directory.
If a file with this name already exists in the current directory - if it is deleted and re-created.
Upon successfull creation of the file - it returns SUCCESS (0).
Otherwise, it returns an ERROR (1)
///
function createFile {
	local fileName=$1
	local folderName=$2
	if [ ! $# -eq 2 ]
	then
		displayError "createFile - invalid number of arguments, excpet 2, got $#"
		return $ERROR
	fi

	if [[ $fileName == *['!'\/]* ]]
	then
  		displayError "createFile - the givne file name is invalid (contains \)"
		return $ERROR
	fi

	if [ ! -d $folderName ]
	then
		displayError "createFile - the provided folder:$folderName does not exist"
		return $ERROR
	fi

	cd $folderName
	touch $fileName
	if [ ! $? -eq 0 ]
	then 
		displayError "createFile - was unable to create the file"
		return $ERROR
	fi

	displayMessageInGreen "file $fileName was created successfully"
	return $SUCCESS	
}

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# for testing the utilties functinos.

<< ///
echo "utilties - start"

createFile file1 .

echo "utilties - end"
///
