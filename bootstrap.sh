#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FLAG=$1
OS=$(uname -n)
echo $OS

if [[ $OS != "fedora" && $OS != "ubuntu" ]]; then
    echo "$OS not supported"
fi

git submodule update --init --recursive

installPackages() {
    if [[ $OS == "fedora" ]]; then
        sudo dnf upgrade --refresh
        sudo dnf install -y \
            vim \
            python3 \
            python3-pip \
            python3-devel \
            git-gui \
            openssh-server \
            htop \
            vlc \
            net-tools \
            tmux \
            cmake \
            gcc \
            g++ \
            make
    elif [[ $OS == "ubuntu" ]]; then
        sudo apt update && sudo apt upgrade -y
        sudo apt install -y \
            vim \
            python3 \
            python3-pip \
            python3-devel \ 
            git-gui \
            openssh-server \
            htop \
            vlc \
            net-tools \
            tmux \
            make \
            cmake \ 
            cmake3 \
            build-essentials
    fi
}

configureVim() {
    rm -rf ~/.vim ~/.vimrc
    ln -s $SCRIPT_DIR/linux_env/.vim ~/.vim
    ln -s $SCRIPT_DIR/linux_env/.vimrc ~/.vimrc
    cd $SCRIPT_DIR/linux_env/.vim/bundle/YouCompleteMe
    python3 install.py --clangd-completer
}

configureTmux() {
    rm ~/.tmux.conf
    ln -s $SCRIPT_DIR/linux_env/.tmux.conf ~/.tmux.conf
}

if [[ $FLAG == "vim" ]]; then
    configureVim
elif [[ $FLAG == "tmux" ]]; then
    conifgureTmux
elif [[ $FLAG == "all" ]]; then
    installPackages
    configureVim
    configureTmux 
fi
