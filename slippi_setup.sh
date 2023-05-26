#!/bin/bash

SOURCE_DIR=$(dirname BASH_SOURCE[0[)
mkdir -p ~/emulators
cd ~/emulators
wget https://github.com/project-slippi/slippi-launcher/releases/download/v2.9.0/Slippi-Launcher-2.9.0-x86_64.AppImage
chmod +x Slippi*.AppImage
