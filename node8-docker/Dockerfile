FROM centos:latest

ADD node-v8.11.3-linux-x64.tar.xz /usr/local

ENV NODE_HOME /usr/local/node-v8.11.3-linux-x64
ENV PATH $PATH:$NODE_HOME/bin
ENV LANG en_US.utf8

RUN mkdir -p /www/webapp && mkdir -p /webapp && mkdir -p /www/logs && \
        ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && npm i -g pm2
#ENV HOSTNAME dubbo-service-provider

#VOLUME ["/webapp"]
