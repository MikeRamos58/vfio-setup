#!/bin/sh
echo "Placing vfio configs..."
sudo cp -v /home/michael/scripts/vfio/etc/modules /etc/modules
sudo cp -v /home/michael/scripts/vfio/etc/initramfs-tools/modules /etc/initramfs-tools/modules
sudo cp -v /home/michael/scripts/vfio/etc/modprobe.d/nvidia.conf /etc/modprobe.d/nvidia.conf
sudo cp -v /home/michael/scripts/vfio/etc/modprobe.d/vfio_pci.conf /etc/modprobe.d/vfio_pci.conf
sudo update-initramfs -c
echo "Ready to reboot!"
