FROM debian:buster
COPY src /cuckoo
COPY Makefile /cuckoo
RUN apt-get -qy update && apt-get -qy install make && cd /cuckoo && make install  
#RUN systemctl enable livirtd && systemctl start libvirtd
EXPOSE 2042
CMD /cuckoo/entrypoint.sh
WORKDIR /root
