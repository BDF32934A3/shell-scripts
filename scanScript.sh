#!/bin/bash

# Author: t3chn0t3s
# Date: 10/04/2020
# Description: Simple script that scans a single target according to my preferences and creates folders for organization

function display_usage() {
    echo "usage: $0 <targetName> <targetIP>"
}

function create_folders() { # TODO Add error handling
    mkdir $targetName\_$targetIP  
    cd $targetName\_$targetIP && mkdir Port_Scan_Results Enummeration Exploits PrivEsc Loot Tools
    echo "Created folders for organization"
}

function run_port_scan() {
    echo "Starting port scan please wait..."
    ports=$(nmap -Pn -p- --min-rate=1000 -T4 $targetIP --open | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
    echo "Finished running Port Scan.  The open ports are: $ports"
}

function enum_open_ports() {
    echo "Starting enumeration of open ports please wait..."
    nmap -A $targetIP -p$ports -oA Port_Scan_Results/$targetName\_$targetIP
    echo "Finished enumeration of open ports.  Results stored in the Port_Scan_Results folder"
}

# Checks whether two arguments are provided
if [ $# -ne 2 ]; then
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

create_folders
run_port_scan 
enum_open_ports






