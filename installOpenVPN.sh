#!/bin/bash

# This script is a work in progress

echo "Updating repos and installing packages..."
sudo apt-get update 1>/dev/null
sudo apt-get install openvpn easy-rsa -y 1>/dev/null

echo "Validating installation of packages..."
dpkg -l | grep -E '^ii' | grep -E 'openvpn|easy-rsa'

echo "Setting up certificates..."
make-cadir ~/openvpn-ca 1>/dev/null
cd ~/openvpn-ca 1>/dev/null

echo "Need to figure out how to script the modification of ~/openvpn-ca/vars values.."

