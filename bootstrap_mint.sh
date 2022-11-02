#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LASTPASS_EMAIL=$1


# update 
sudo add-apt-repository ppa:mozillacorp/mozillavpn
sudo apt update
sudo apt upgrade -y

# apt installs
sudo apt install vim steam python3 git openssh-server virtualbox mumble dolphin bashtop resolvconf mozillavpn ssh xclip lastpass-cli

# snap installs
sudo apt install snapd
snap install discord
snap install spotify
snap install mc-installer

# Aliases
cat ${SCRIPT_DIR}/aliases >> ~/.bashrc

# Open apps to start updates
steam &
spotify &
discord &

lpass login ${LASTPASS_EMAIL}

