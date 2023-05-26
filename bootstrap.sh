sudo add-apt-repository ppa:mozillacorp/mozillavpn
sudo apt update
sudo apt upgrade -y
sudo apt install -y  \
vim                  \
steam                \
python3              \
python3-pip          \
git                  \
git-gui              \
openssh-server       \
virtualbox           \
mumble               \
dolphin              \
bashtop              \
resolvconf           \
mozillavpn           \
ssh                  \
xclip                \
vlc                  \
obs-studio           \
gimp                 \
net-tools            \
gnome-shell-extension-manager\
cmake\
tmux

sudo apt install snapd
snap install discord
snap install spotify
snap install mc-installer
snap install code --classic

echo "alias xc='xclip -sel c'" >> ~/.bashrc

