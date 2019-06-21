#!/bin/bash

# This script installs dnscat2 and compiles the client binary

echo "/// Updating repos and installing dependancies..."
sudo apt-get update 1>/dev/null
sudo apt-get install ruby-dev gcc make -y 1>/dev/null

echo "/// Cloning and building dnscat2..."
sudo git clone https://github.com/iagox86/dnscat2.git /opt/dnscat2/ 1>/dev/null
cd /opt/dnscat2/server/ 1>/dev/null
sudo gem install bundler 1>/dev/null
bundle install

echo "/// Building dnscat2 client..."
cd /opt/dnscat2/client 1>/dev/null
sudo make 1>/dev/null

echo "/// Process complete"
