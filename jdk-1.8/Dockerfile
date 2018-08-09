FROM centos

#RUN yum install -y wget
#http://nexus.td.internal/nexus/repository/files/env/jdk/jdk-8u171-linux-x64.tar.gz
RUN mkdir -p /www/webapp && mkdir -p /webapp && mkdir -p /www/logs && mkdir -p /usr/local/jdk && \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

ADD ["jdk1.8.tar.gz", "/usr/local/jdk/"]
#ADD ["entrypoint.sh", "/"]

#RUN ls /usr/local/jdk
#RUN mkdir -p /www/webapp

ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_181
ENV PATH $PATH:$JAVA_HOME/bin
ENV CLASSPATH .:$JAVA_HOME/lib
ENV LANG en_US.utf8
#ENV HOSTNAME dubbo-service-provider

VOLUME ["/webapp"]

#CMD ["/entrypoint.sh"]


