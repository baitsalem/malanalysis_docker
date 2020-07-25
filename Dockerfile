FROM debian:buster
COPY . /cuckoo
RUN apt-get -qy update && apt-get -qy install make && cd /cuckoo &&  make install  
CMD /cuckoo/entrypoint.sh
