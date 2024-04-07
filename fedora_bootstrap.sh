#!/usr/bin/env bash
SCRIPT_DIR=( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
OS=$(uname -n)
echo $OS

if [[ $OS == "fedora" ]]; then
    $SCRIPT_DIR/install_fedora_packages.sh
elif [[ $OS == "ubuntu" ]]; then
    $SCRIPT_DIR/install_ubuntu_packages.sh
fi

