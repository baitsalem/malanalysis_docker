#!/bin/bash
set -e

# Create the kvm node (required --privileged)
if [ ! -e /dev/kvm ]; then
   mknod /dev/kvm c 10 $(grep '\<kvm\>' /proc/misc | cut -f 1 -d' ')
fi

cuckoo --cwd /opt/cuckoo
cp -r conf /opt/cuckoo/.cuckoo

virt-install --name=cuckoo --vcpus=1 --memory=1024 --disk /VMS/win12.qcow --import

snapshot_name=$(virsh snapshot-create cuckoo | cut -d ' ' -f 3)

if [ ! -z ${snapshot_name} ]

fi

