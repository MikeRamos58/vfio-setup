#!/bin/sh
echo "Setting up VFIO..."
sudo cp ./files/nvidia.conf /etc/modprobe.d/vfio.conf
sudo cp ./files/mkinitcpio.conf /etc/mkinitcpio.conf
sudo update-initramfs -c
echo "Ready to reboot!"
