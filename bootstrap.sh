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
    if test -f /usr/bin/dnf; then
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
            make \
            universal-ctags \
            keepassxc \
            nvtop \
            picom \
            xfce4-terminal
    elif test -f /usr/bin/apt; then
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
            build-essential \
            universal-ctags \
            keepassxc \
            nvtop \
            picom \
            xfce4-terminal
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

configure_i3(){
    if test -f ~/.config/i3/config; then
        rm ~/.config/i3/config
    fi

    ln -s $SCRIPT_DIR/linux_env/i3/config ~/.config/i3/config
}

configure_picom(){
    if test -f ~/.config/picom.conf; then
        rm ~/.config/picom.conf
    fi

    ln -s $SCRIPT_DIR/linux_env/picom.conf ~/.config/picom.conf
}

#configureFstab(){
# # TODO
#}

if [[ $FLAG == "vim" ]]; then
    configureVim
elif [[ $FLAG == "tmux" ]]; then
    configureTmux
elif [[ $FLAG == "i3" ]]; then
    configure_i3
elif [[ $FLAG == "picom" ]]; then
    configure_picom
elif [[ $FLAG == "all" ]]; then
    installPackages
    configureVim
    configureTmux
    configure_i3
    configure_picom
fi

