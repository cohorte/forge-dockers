FROM httpd:2.4

MAINTAINER Bassem Debbabi <bassem.debbabi@isandlatech.com>

# install tools
RUN apt-get update && apt-get install -y vim

COPY ./conf /usr/local/apache2/conf

# create certs directory
RUN mkdir -p /etc/letsencrypt

# volume
VOLUME ["/etc/letsencrypt", "/usr/local/apache2/conf"]
