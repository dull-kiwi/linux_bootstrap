#echo max_parallel_downloads=10 >> /etc/dnf/dnf.conf
#echo fastestmirror=True >> /etc/dnf/dnf.conf
sudo dnf upgrade --refesh
sudo dnf install -y \
    vim \
    python3 \
    python3-pip \
    git \
    git-gui \
    openssh-server \
    htop \
    vlc \
    net-tools \
    tmux \
    cmake
