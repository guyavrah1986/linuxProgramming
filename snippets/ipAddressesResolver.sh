#!/bin/bash
# =======================================================================================================================
# =======================================================================================================================

function createTmpFile {
	local tmpFileName=$1
	if [ -e $tmpFileName ] # check if the given file already exists
	then
		echo "removing already existing (old) $tmpFileName"
		rm $tmpFileName
	fi

	touch $tmpFileName
}

function getIpV4AddressLines {
	res1=$(ifconfig | grep -w -B 1 'inet') #| grep '^*:\>') # https://stackoverflow.com/questions/16317961/how-to-process-each-line-received-as-a-result-of-grep-command
	echo "echoing res1:"
	echo $res1
	lineNum=1
	#namesList="Guy Roei Rotem Kalter"
	echo "The following lines are:"
	for var in $res1
	do
		echo "line $nameNum: $var"
		echo ""
		((lineNum++))
	done
}

# =======================================================================================================================
# =======================================================================================================================

echo "==============================="
echo "$0 - start"
echo "==============================="

# create tmp file to work on
currDir=$(pwd)
tmpFile=tmp.txt
echo "current working directory is:$currDir"
createTmpFile $tmpFile

# echo the output of the ifconfig command into the tmp file
ifconfig >$tmpFile 
echo "cat $tmpFile"
cat $tmpFile

# get ALL IP addresses and thier "sourounding lines"
getIpV4AddressLines

echo "==============================="
echo "$0 - end"
echo "==============================="
