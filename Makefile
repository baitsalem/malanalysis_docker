install : 
	sudo apt -qy python \ 
        python-pip \ 
      	python-dev \
        libffi-dev \
        libssl-dev \
        python-virtualenv \ 
        python-setuptools \
        libjpeg-dev \
        zlib1g-dev \
        swig  \
        mongodb \ 
        postgresql \ 
        libpq-dev \
	qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils python-libvirt \	  
	libcap2-bin \
        libguac-client-rdp0 \ # skip the two next installation if i want only rdp support 
        libguac-client-vnc0 \
        libguac-client-ssh0 \
        guacd \
        lsof \
        psmisc \
	tcpdump \

	# manage tcpdump
	sudo groupadd pcap
	sudo usermod -a -G pcap cuckoo
	sudo chgrp pcap /usr/sbin/tcpdump
	sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
        # or sudo chmod +s /usr/sbin/tcpdump and uninstall libcap2-bin

	#install M2crypto
  	pip install M2Crypto


	#install cuckoo
	sudo adduser cuckoo
	sudo usermod -a -G libvirtd cuckoo
	sudo pip install -U pip setuptools
	sudo pip install -U cuckoo
	
