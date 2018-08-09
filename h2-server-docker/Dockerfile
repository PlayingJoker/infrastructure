from jdk1.8:latest

RUN mkdir -p /h2/data && mkdir -p /h2/log

COPY h2-1.4.190.jar /webapp

COPY entrypoint.sh /webapp

VOLUME /h2

EXPOSE 9092 8082

CMD /webapp/entrypoint.sh
