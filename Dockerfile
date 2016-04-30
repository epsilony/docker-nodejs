# use nodejs in China mainland, according to the silly network environment

FROM epsilony/baseimage

MAINTAINER Man YUAN

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN sudo apt-get install -y nodejs

RUN npm install  -g cnpm --registry=https://registry.npm.taobao.org 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
