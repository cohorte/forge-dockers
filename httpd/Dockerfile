FROM httpd:2.4.34

MAINTAINER Bassem Debbabi <bassem.debbabi@isandlatech.com>

# install tools
RUN apt-get update && apt-get install -y vim


COPY ./conf/* /usr/local/apache2/conf/
COPY ./htdocs/* /usr/local/apache2/htdocs/

# create certs directory
RUN mkdir -p /etc/letsencrypt
RUN mkdir -p /usr/local/apache2/vhosts


