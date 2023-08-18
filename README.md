1. Install dependancies: 

    For Debian-based systems:
    ```bash
    ./install-deps-deb.sh
    ```

    For Arch-based systems:
    ```bash
    ./install-deps-arch.sh
    ```

2. Add yourself to the libvirt group:

    `sudo usermod -a -G libvirt $(whoami)`
    
3. Add the following options to `GRUB_CMDLINE_LINUX_DEFAULT`:

    /etc/default/grub
    ```
    GRUB_CMDLINE_LINUX_DEFAULT="... iommu=1 amd_iommu=on pcie_acs_override=downstream ..."
    ```

4. Update grub:

    ```bash
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

5. Check device ids and modify configurations files if necessary:

    `ls-iommu.sh`

6. Place vfio configuration files:

    `setup.sh`

7. Reboot and check device is bound to the vfio driver:

    `ls-pci.sh`

8. Enable/start libvirtd:

    `sudo systemctl enable libvirtd.service`  

    `sudo systemctl start libvirtd.service`  
      
9. Edit `/etc/apparmor.d/abstractions/libvirt-qemu`:
    ````
    # for usb access
    /dev/bus/usb/** rw,
    /etc/udev/udev.conf r,
    /sys/bus/ r,
    /sys/class/ r,
    /run/udev/data/* rw,
    ````

10. Restart apparmor:

    `service apparmor restart`

11. Install VM.

12. Fix code 43 issue:

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
