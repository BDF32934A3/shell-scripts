#!/bin/bash
apt-get update -y # Updates repo
apt-get install python git -y # Installs python and git
git clone https://github.com/trustedsec/ptf /opt/ptf # Clones ptf to /opt/ptf
# Executes ptf and runs unattended updates
cd /opt/ptf && ./ptf <<EOF
use modules/exploitation/install_update_all
yes
use modules/intelligence-gathering/install_update_all
yes
use modules/post-exploitation/install_update_all
yes
use modules/powershell/install_update_all
yes
use modules/vulnerability-analysis/install_update_all
cd /pentest
EOF
