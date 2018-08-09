FROM centos

RUN mkdir -p /webapp

ADD IntelliJ.tar.gz /webapp

ADD entrypoint.sh /

EXPOSE 9996

ENTRYPOINT /entrypoint.sh
