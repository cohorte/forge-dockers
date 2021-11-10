FROM httpd:2.4.51

MAINTAINER Bassem Debbabi <bassem.debbabi@isandlatech.com>

# install tools
RUN apt-get update && apt-get install -y vim python3


COPY ./conf/* /usr/local/apache2/conf/
COPY ./htdocs/* /usr/local/apache2/htdocs/
COPY ./python /usr/local/apache2/python
COPY ./cgi-shells /usr/local/apache2/cgi-shells

# create certs directory
RUN mkdir -p /etc/letsencrypt
RUN mkdir -p /usr/local/apache2/vhosts
RUN mkdir -p /opt/httpd/log/

RUN chmod -R a+x /usr/local/apache2/cgi-shells


