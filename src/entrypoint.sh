#!/bin/bash

set -e

# Script : entrypoint.sh
# But : script d'initialisaton du docker destiné à l'analyse de malware et tout particulièrement l'initialisation de cuckoo
# usage : docker run -it --privileged -v /media/usb1/VMS:/VMS -e VM="win12.qcow" cuckoo:1.0

CREQUEST='\e[0;1;35m' # Magenta
CCOMMANDE='\e[0;1;37m' # Blanc
CERROR='\e[0;1;31m' # Rouge
CFILE='\e[1;33m' # Jaune
CINFO='\e[4;1;31m' # Rouge souligné
VERT='\e[1;32m' # Ok
BLANC='\e[1;37m' 

SansCouleur='\e[0;m'



# Create the kvm node (required --privileged)
if [ ! -e /dev/kvm ]; then
   mknod /dev/kvm c 10 $(grep '\<kvm\>' /proc/misc | cut -f 1 -d' ')
fi

if [ -z ${VM} ] || [ ! -d /VMS ]
then
	echo -e "${CERROR}No vm name specified or ${CFILE}/VMS ${CERROR}path do not exist${SansCouleur}"
	exit 1
fi

cuckoo --cwd /opt/cuckoo
cp -r /cuckoo/conf /opt/cuckoo/.cuckoo # must be before with all configuration file

echo -e "${BLANC}Create ${CFILE}/VMS/${VM}${BLANC} vm for cuckoo purpose${SansCouleur}"

#virsh net-undefine default
#virsh net-destroy default
#virsh net-list
#virsh net-define /usr/share/libvirt/networks/default.xml
#virsh net-start default


virsh net-autostart default
virsh net-start default

if virt-install --name=cuckoo --vcpus=1 --memory=1024 --disk /VMS/${VM} --import
then
	snapshot_name=$(virsh snapshot-create cuckoo | cut -d ' ' -f 3)
else
	echo -e "${CERROR}Can not install cuckoo vm${SansCouleur}"
	exit 2
fi

if [  -z ${snapshot_name} ]
then

	echo -e "${CERROR}Snapshot creation failed${SansCouleur}"
	exit 3
fi





