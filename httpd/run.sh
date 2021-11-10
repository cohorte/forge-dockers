#!/bin/bash


# copy cgi shell directory in htdocs
cp /usr/local/apache2/cgi-shells /usr/local/apache2/htdocs/cgi-shells
# call the origin cmd 
sh /usr/local/bin/httpd-foreground