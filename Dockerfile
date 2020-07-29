FROM tianon/exim4:latest
COPY src /cuckoo
COPY Makefile /cuckoo
RUN apt-get -qy update && apt-get -qy install make && cd /cuckoo && make install && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_* 
RUN systemctl enable livirtd && systemctl start libvirtd
EXPOSE 2042
CMD /cuckoo/entrypoint.sh
WORKDIR /root
