# malanalysis_docker
Docker with mlaware analysis tools

```
 docker run --privileged -p 3022:3022 --env RAM_SIZE=2048 --env IMAGE_PATH="/parrotsec.vdi" -v /media/usb1/VMS/parrotsec.vdi/parrotsec.vdi:/parrotsec.vdi kvm:2.1
docker run -it --device=/dev/kvm --device=/dev/net/tun -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --security-opt apparmor=unconfined -e VM=win12.qcow -v /media/usb1/VMS:/VMS cuckoo:1.0 /bin/bash
```

# Liens:

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
https://linux.goffinet.org/administration/virtualisation-kvm/
