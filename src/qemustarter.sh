#!/bin/bash
set -e

#RAM_SIZE=$1
#IMAGE_PATH=$2

# Create the kvm node (required --privileged)
if [ ! -e /dev/kvm ]; then
   mknod /dev/kvm c 10 $(grep '\<kvm\>' /proc/misc | cut -f 1 -d' ')
fi

#PORT EXPOSE FORMAT
#-net user,hostfwd=tcp::3389-:3389 -redir tcp:3022::22

if [[ -z $RAM_SIZE ]] || [[ -z $IMAGE_PATH ]]; then
	echo "Please define $RAM_SIZE and $IMAGE_PATH to launch the kvm"
	exit
fi

#printf "change vnc password\n%s\n" MYPASSWORD | 
qemu-system-x86_64 -net nic,model=rtl8139 -m $RAM_SIZE  -hda $IMAGE_PATH -vnc 0.0.0.0:0  
