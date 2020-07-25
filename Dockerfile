FROM debian:buster
COPY . /cuckoo
RUN make /cuckoo
CMD /cuckoo/entrypoint.sh
