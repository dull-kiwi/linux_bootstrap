#sudo apt install -y\
#	libx11-dev\
#	ffmpeg\
#	pkg-config\
#	libgl1-mesa-dev\
#        libevdev-dev\
#	liblzma-dev
sudo apt install -y build-essential git cmake ffmpeg libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libevdev-dev libusb-1.0-0-dev libxrandr-dev libxi-dev libpangocairo-1.0-0 qt6-base-private-dev libbluetooth-dev libasound2-dev libpulse-dev libgl1-mesa-dev liblzma-dev
sudo apt install -y libudev-dev libsystemd-dev
SCRIPT_DIR=$(dirname BASH_SOURCE[0])
mkdir -p ~/src
cd ~/src
git clone git@github.com:dolphin-emu/dolphin.git
cd ./dolphin
git submodule update --init Externals/mGBA
git submodule update --init Externals/spirv_cross
git submodule update --init Externals/zlib-ng
git submodule update --init Externals/libspng
git submodule update --init Externals/VulkanMemoryAllocator
git submodule update --init --recursive Externals/cubeb
git submodule update --init Externals/implot
git submodule update --init Externals/gtest
git submodule update --init Externals/rcheevos
git pull --recurse-submodules

mkdir -p ~/builds/dolphin-emu
cd ~/builds/dolphin-emu
cmake -S ~/src/dolphin -B .
make -j$(nproc)
sudo make install
cd ${SCRIPT_DIR}
./gc_controller_setup.sh
