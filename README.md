1. Install dependancies: 

    `install-deps.sh`

2. Modify grub configuration:
    ````
    GRUB_CMDLINE_LINUX_DEFAULT="amd_iommu=on"
    ````

3. Updage grub:

    `sudo update-grub`

4. Check device ids and modify configurations files if necessary:

    `ls-iommu.sh`

5. Place vfio configuration files:

    `setup.sh`

6. Reboot and check device is bound to the vfio driver:

    `ls-pci.sh`

7. Enable/start libvirtd:

    `sudo systemctl enable libvirtd.service`  

    `sudo systemctk start libvirtd.service`  

8. Edit `/etc/apparmor.d/abstractions/libvirt-qemu`:
    ````
    # for usb access
    /dev/bus/usb/** rw,
    /etc/udev/udev.conf r,
    /sys/bus/ r,
    /sys/class/ r,
    /run/udev/data/* rw,`
    ````

9. Restart apparmor:

    `serive apparmor restart`

10. Install VM.

11. Fix code 43 issue:

    `virsh edit <VM-name>`
    
    ````
    <hyperv>
      <relaxed state='on'/>
      <vapic state='on'/>
      <spinlocks state='on' retries='8191'/>
      <vendor_id state='on' value='whatever'/>
    </hyperv>
    <kvm>
      <hidden state='on'/>
    </kvm>` 
    ````
