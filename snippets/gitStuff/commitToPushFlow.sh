#!/bin/bash

source ../utilities.sh

displayMessageInGreen "================================="
displayMessageInGreen "$0 - start"
displayMessageInGreen "================================="

read -p "enter a message for the commit comment" commitDescription
git add -A
git commit -m "$commitDescription" 
git push origin master

displayMessageInGreen "================================="
displayMessageInGreen "$0 - end"
displayMessageInGreen "================================="
