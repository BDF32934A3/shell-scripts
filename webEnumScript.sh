#!/bin/bash

# Author: t3chn0t3s
# Date: 10/12/2020
# Description: Simple script to automate some regular web server/app enumeration tasks.  



function display_usage() {
    echo "usage: $0 <targetName> <targetIP> <targetPort> <http|https> <wordlist> <fileExt> "
    echo "example: $0 WebServer1 10.10.10.1 443 https directory-list-2.3-small.txt php"
}

function create_Folders() { # TODO Add error handling
    mkdir $targetName\_$targetIP  
    cd $targetName\_$targetIP && mkdir Enumeration
    echo "Created folders for organization"
}

function take_Screenshot() {
    echo "Taking screenshot of web app..."
    mate-terminal --title="eyewitness" --tab -e "bash -c 'eyewitness --single $targetProtocol://$targetIP -d Enumeration/$targetName\_$targetIP\_eyewitness --no-prompt;bash'"
}

function open_Browser() {
    echo "Opening web app in browser..."
    google-chrome $targetProtocol://$targetIP &>/dev/null &
    google-chrome $targetProtocol://$targetIP/robots.txt &>/dev/null &
}

function run_Nikto() {
    echo "Starting web vulnerability scanning in another tab..."
    mate-terminal --title="Nikto" --tab -e "bash -c 'nikto -host $targetProtocol://$targetIP -output Enumeration/$targetName\_$targetIP\_nikto.html -Format htm;bash'"
}

function run_Gobuster() {
    echo "Starting content discovery in another tab..."
    mate-terminal --title="Gobuster" --tab -e "bash -c 'gobuster dir -u $targetProtocol://$targetIP -w $wordList -x $fileExt -s '200,301,302' -e -k -o Enumeration/$targetName\_$targetIP\_gobuster.txt;bash'"
}

# Checks whether two arguments are provided
if [ $# -ne 6 ]; then
    display_usage
    exit 1
fi

# Checks whether user asked for help
if [[ ( $# == "--help") ||  $# == "-h" ]]; then 
	display_usage
	exit 0
fi 


targetName=$1
targetIP=$2
targetPort=$3 
targetProtocol=$4
wordList=$5
fileExt=$6 

create_Folders
take_Screenshot
open_Browser
run_Nikto
run_Gobuster
