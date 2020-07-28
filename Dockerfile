FROM debian:buster
COPY src /cuckoo
RUN apt-get -qy update && apt-get -qy install make && cd /cuckoo &&  make install  
EXPOSE 2042
CMD /cuckoo/src/entrypoint.sh
WORKDIR /root
