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
    else
        sudo apt update
        sudo apt install -y \
            vim \
            python3 \
            python3-pip \
            python3-dev \
            git-gui \
            openssh-server \
            htop \
            vlc \
            net-tools \
            tmux \
            make \
            cmake \
            build-essential
    fi
}

configureVim() {
    if test -f ~/.tmux.conf; then
        rm -rf ~/.vim ~/.vimrc
    fi

    ln -s $SCRIPT_DIR/linux_env/.vim ~/.vim
    ln -s $SCRIPT_DIR/linux_env/.vimrc ~/.vimrc
    cd $SCRIPT_DIR/linux_env/.vim/bundle/YouCompleteMe
    python3 install.py --clang-completer
}

configureTmux() {
    if test -f ~/.tmux.conf; then
        rm ~/.tmux.conf
    fi

    ln -s $SCRIPT_DIR/linux_env/.tmux.conf ~/.tmux.conf
}

if [[ $FLAG == "vim" ]]; then
    configureVim
elif [[ $FLAG == "tmux" ]]; then
    configureTmux
elif [[ $FLAG == "all" ]]; then
    installPackages
    configureVim
    configureTmux
fi
