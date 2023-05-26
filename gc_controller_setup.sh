sudo echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' > /etc/udev/rules.d/51-gcadapter.rules
sudo udevadm control --reload-rules
