1. Install dependancies:
..* `install-deps.sh`

2. Modify grub configuration:
`GRUB_CMDLINE_LINUX_DEFAULT="amd_iommu=on"`

3. Updage grub:
`sudo update-grub`

4. Check device ids and modify configurations files if necessary:
ls-iommu.sh

5. Place vfio configuration files:
`setup.sh`

6. Reboot and check device is bound to the vfio driver:
`ls-pci.sh`
