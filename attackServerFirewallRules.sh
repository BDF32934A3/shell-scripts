#!/bin/bash
# Checks for the correct number of arguments
if [ $# -ne 1 ]; then
  echo "Error: The correct number of arugments were not provided"
  echo "Usage $0 <ssh_src_network_or_host>"
else
  # Checks wheter ufw is installed and if it isn't it installs it
  if [ $(dpkg-query -W -f='${Status}' ufw 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
      echo 'UFW is not installed.  Installing it now...'
      apt-get update 1>/dev/null
      apt-get install ufw -y 1>/dev/null;
  fi
# Adds a rule that allows the specified ssh_src_network_or_host to connect to the ssh port and enables ufw
echo "Adding rule allowing SSH connections from $1"
ufw allow from $1 to any port 22
ufw enable
ufw status
fi
