FROM centos

RUN mkdir -p /webapp

ADD intellij.tar /webapp

ADD entrypoint.sh /

EXPOSE 9996

ENTRYPOINT /entrypoint.sh
