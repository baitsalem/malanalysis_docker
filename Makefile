install :
	 apt-get  update -y
	 apt-get  upgrade -y 
	 apt-get  install -y --no-install-recommends build-essential  python  python-pip python-dev libffi-dev libssl-dev python-virtualenv python-setuptools libjpeg-dev zlib1g-dev swig postgresql libpq-dev qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils python-libvirt libcap2-bin lsof psmisc tcpdump 
	# install mongodb
	 apt-get install -y --no-install-recommends dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl
	curl -fsSL https://www.mongodb.org/static/pgp/server-4.2.asc |  apt-key add -
	 add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main'
	 apt -y update
	 apt -y install mongodb-org
	#install M2crypto
	pip install M2Crypto
	#install cuckoo
	 adduser cuckoo
	# usermod -a -G libvirtd cuckoo
	 pip install -U pip setuptools
	 pip install -U cuckoo
	 #manage tcpdump
	 groupadd pcap
	 usermod -a -G pcap cuckoo
	 chgrp pcap /usr/sbin/tcpdump
	 setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
	# or  chmod +s /usr/sbin/tcpdump and uninstall libcap2-bin

