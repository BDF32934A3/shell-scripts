#!/bin/bash

# Author: t3chn0t3s
# Date: 01/03/2021
# Description: Python 2 is EoL, but many tools have not yet been ported to Python 3.
# Pyenv can be used to continue using tools that depend on Python2. This script
# is based on the article linked below.
# https://www.kali.org/docs/general-use/using-eol-python-versions/

printf "Installing the install script's dependancies\r\n"
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

printf "Downloading and piping install script to bash\r\n"
curl https://pyenv.run | bash

# FIXME: This could be done better
printf "Updating/Appending to ~/.bashrc\r\n"
echo '
# Adding for Pyenv/support of EoL Python
export PATH="/home/andres/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
' >> ~/.bashrc

printf "Confirming changes to ~/.bashrc and sourcing the file.\r\n"
tail -6 ~/.bashrc 
source ~/.bashrc

printf "Using pyenv to install Python2 and setting it as default version\r\n"
pyenv install 2.7.18
pyenv global 2.7.18

printf "If you need to switch back to Python3  use 'pyenv global system'\r\n"