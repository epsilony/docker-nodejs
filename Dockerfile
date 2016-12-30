# use nodejs in China mainland, according to the silly network environment

FROM phusion/baseimage:0.9.19

MAINTAINER Man YUAN

COPY sources.list /etc/apt/

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt upgrade -y \
    && apt install -y nodejs netcat \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN npm install  -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm install -g pm2 \
    && rm -rf /tmp/* /var/tmp/*

RUN echo 'Asia/Shanghai' > /etc/timezone

RUN dpkg-reconfigure --frontend noninteractive tzdata 
