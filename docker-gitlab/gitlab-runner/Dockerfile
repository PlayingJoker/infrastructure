
FROM home1oss/ci-ubuntu:16.04

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

RUN echo "deb https://packages.gitlab.com/runner/gitlab-ci-multi-runner/ubuntu/ xenial main" > /etc/apt/sources.list.d/runner_gitlab-ci-multi-runner.list && \
    wget -q -O - https://packages.gitlab.com/gpg.key | apt-key add - && \
    apt-get update -y && \
    apt-get install -y gitlab-ci-multi-runner=9.1.1 && \
    apt-get clean && \
    mkdir -p /etc/gitlab-runner/certs && \
    chmod -R 700 /etc/gitlab-runner && \
    rm -rf /var/lib/apt/lists/*
ADD docker/entrypoint /
RUN chmod +x /entrypoint

COPY docker/set_env.sh /root/
# Set environment variables, add user gitlab-runner into docker group, fix Directory permissions.
RUN chmod +x /root/set_env.sh && \
    /root/set_env.sh && \
    gpasswd -a gitlab-runner docker && \
    chown -R gitlab-runner:root /opt/node-*/lib && \
    chown -R gitlab-runner:root /opt/node-*/bin

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
EXPOSE 15903

ADD http://nexus.td.internal/nexus/repository/files/apama/so.zip /lib

RUN cd /lib && unzip so.zip -d ./ && mv ./so/* ./ && chmod 777 ln.sh && bash ./ln.sh 

ADD http://nexus.td.internal/nexus/repository/files/apama/softwareag.tar.gz /opt
RUN chmod 666 /opt/softwareag.tar.gz
# replace apama env 
RUN cd /opt && tar -zxvf softwareag.tar.gz && chmod 777 -R ./softwareag && \
    sed -i 's/\/home\/gitlab-runner/\/opt/g' /opt/softwareag/Apama/bin/apama_env && \
    sed -i 's/\/home\/gitlab-runner/\/opt/g' /opt/softwareag/ApamaCapitalMarketsFoundation/bin/CMF_env
    
RUN echo ". /opt/softwareag/Apama/bin/apama_env" >> /etc/profile && \
    echo ". /opt/softwareag/ApamaCapitalMarketsFoundation/bin/CMF_env" >> /etc/profile

ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]
