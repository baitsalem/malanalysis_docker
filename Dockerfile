FROM tianon/exim4:latest
ENV DEBIAN_FRONTEND noninteractive
COPY src /cuckoo
COPY Makefile /cuckoo
RUN apt-get -qy update && apt-get -qy install make && cd /cuckoo && make install && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_* 
EXPOSE 2042
CMD ["/lib/systemd/systemd"]
CMD /cuckoo/entrypoint.sh
WORKDIR /root
