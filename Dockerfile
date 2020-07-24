FROM debian:buster

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends qemu-kvm libvirt-clients libvirt-daemon-system
ADD entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
