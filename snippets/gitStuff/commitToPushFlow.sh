#!/bin/bash

source ../utilities/utilities.sh

function deletingFiles {
	local filesToDelete=$1
	echo "deletingFiles - got arg1:$filesToDelete"
	for fileToDelete in $filesToDelete
	do
		if [ $fileToDelete == "deleted:" ]
		then
			continue
		fi

		echo "deletingFiles - deleting file:$fileToDelete"
		local gitRmRes=$(git rm "$fileToDelete")
		if [ ! $? -eq 0 ]
		then 
			displayError "deletingFiles - was unable to perform git rm to file:$fileToDelete"
			return $ERROR
		fi
	done
	
	return $SUCCESS
}

function addModifiedAndUntracktedFiles {
	local gitAddAllRes=$(git add -A)
	if [ ! $? -eq 0 ]
	then
		displayError "addModifiedAndUntracktedFiles - was unable to add one or more files"
		return $ERROR
	fi

	return $SUCCESS
}

function doCommit {
	read -p "doCommit - please enter the commit description:" commitDescription
	commitRes=$(git commit -m "$commitDescription")
	if [ ! $? -eq 0 ]
	then
		displayError "doCommit - was unable to perform commit"
		return $ERROR
	fi

	return $SUCCESS
} 

function fastCommit {
	local deletedFilesLines=$(git status | grep 'deleted:')
	echo "fastCommit - git status deleted gave:$deletedFilesLines"
	# 1) git rm (remove deleted files)
	if [ ! -z "$deletedFilesLines" ]
	then
		echo "fastCommit - starting by deleting the required files"
		deletingFiles "$deletedFilesLines"
	fi

	if [ ! $? -eq 0 ]
	then
		displayError "fastCommit - deletingFiles raised an error"
		return $ERROR
	fi
	
	# 2) git add -A	
	addModifiedAndUntracktedFiles
	if [ ! $? -eq 0 ]
	then
		displayError "fastCommit - addModifiedAndUntracktedFiles raised an error"
		return $ERROR
	fi
	
	# 3) git commit
	doCommit
	if [ ! $? -eq 0 ]
	then
		displayError "fastCommit - doCommit raised an error"
		return $ERROR
	fi
	
	# 4) git push
	git push
	if [ ! $? -eq 0 ]
	then
		displayError "fastCommit - git push raised an error"
		return $ERROR
	fi

	return $SUCCESS
}


displayMessageInGreen "================================="
displayMessageInGreen "$0 - start"
displayMessageInGreen "================================="

<< ///

read -p "enter a message for the commit comment" commitDescription
git add -A
git commit -m "$commitDescription" 
git push origin master

///

fastCommit

displayMessageInGreen "================================="
displayMessageInGreen "$0 - end"
displayMessageInGreen "================================="
