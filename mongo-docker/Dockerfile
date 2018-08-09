FROM mongo:latest

COPY ["conf/key.conf", "/etc/conf/key.conf"]

RUN chown mongodb:mongodb /etc/conf/key.conf && chmod 600 /etc/conf/key.conf

EXPOSE 27017

CMD ["mongod"]