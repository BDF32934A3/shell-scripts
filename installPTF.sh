#!/bin/bash
apt-get update -y # Updates repo
apt-get install python git -y # Installs python and git
git clone https://github.com/trustedsec/ptf /opt/ptf # Clones ptf to /opt/ptf
cd /opt/ptf && ./ptf # Executes ptf
 
