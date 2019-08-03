#!/bin/bash
# Based on THP3 CH02

# Date variables
d=$(date +%Y-%m-%d)
y=$(date -d yesterday +%Y-%m-%d)


# Creates directory to store files
if [ ! -d /opt/nmap_diff ]; then
  mkdir -p /opt/nmap_diff;
fi

# Runs a nmap scan, using a target list, that saves output as XML file that includes a timestamp
nmap -T4 -Pn -p- -iL targetlist.txt -oX /opt/nmap_diff/scan_$d.xml > /dev/null #2>&1

# Compares yesterdays XML file with today's XML and if there are differences sames them to diff.txt
if [ -e /opt/nmap_diff/scan$.y.xml ]; then
	/usr/bin/ndiff /opt/nmap_diff/scan_$y.xml /opt/nmap_diff/scan$d.xml > /opt/nmap_diff/diff.txt
fi
