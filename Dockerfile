FROM debian:stretch

RUN apt-get update
RUN apt-get install -y build-essential php-dev git

WORKDIR /root

ADD . /root
RUN phpize
RUN ./configure
RUN make
RUN make install

# Running the image prints the tarball to stdout
CMD tar -zcv --absolute-names --dereference /root/modules/redis.so /usr/lib/php/20151012/redis.so
