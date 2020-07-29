install :
	 apt-get  update -y
	 apt-get install -y build-essential apt-utils python python-pip python-dev libffi-dev libssl-dev python-virtualenv python-setuptools libjpeg-dev zlib1g-dev
	 python -m pip install --upgrade pip 
	 # install kvm qemu
	 apt-get install  -y qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils python-libvirt #virt-manager 
	 apt-get  install  -y swig
	 apt-get  install  -y --no-install-recommends postgresql 
	 apt-get  install  -y postgresql 
	 apt-get install -y libpq-dev libcap2-bin lsof psmisc tcpdump python-magic  
	# install mongodb
	 apt-get install -y dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl
	 curl -fsSL https://www.mongodb.org/static/pgp/server-4.2.asc |  apt-key add -
	 add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main'
	 apt -y update
	 apt -y install mongodb-org
	#install M2crypto
	 pip  install M2Crypto --use-feature=2020-resolver
	#install cuckoo
	 adduser cuckoo
	 usermod -a -G libvirt cuckoo
	 pip install -U pip setuptools --use-feature=2020-resolver
	 pip install -U cuckoo --use-feature=2020-resolver
	 #manage tcpdump
	 groupadd pcap
	 usermod -a -G pcap cuckoo
	 chgrp pcap /usr/sbin/tcpdump
	 setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
	# or  chmod +s /usr/sbin/tcpdump and uninstall libcap2-bin
	
	 mkdir /opt/cuckoo
	 chown cuckoo:cuckoo /opt/cuckoo
	 mkdir /VMS
