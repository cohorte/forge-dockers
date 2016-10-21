FROM jenkins:2.7.2

MAINTAINER Bassem Debbabi <bassem.debbabi@isandlatech.com>

# change to root user to install via apt-get
USER root

# install python compilation tools
RUN apt-get update \
		&& apt-get install -y sudo python3 virtualenv python-pip python-dev build-essential \
		&& rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# devpi (pip) client
RUN pip install devpi-client

# drop back to the regular jenkins user
USER jenkins