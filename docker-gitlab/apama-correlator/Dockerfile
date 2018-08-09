FROM centos:7

# cli: docker run -d -p 15903:15903   containerId

# 开放correlator端口
EXPOSE 15903

# 安装unzip
RUN yum install -y unzip zip

# 设置apama环境变量
ENV APAMA_PLATFORM=amd64-rhel6
ENV APAMA_FOUNDATION_VERSION=10.0
ENV APAMA_DASHBOARD_HOME=/opt/softwareag/Apama
ENV ANT_HOME=/opt/softwareag/Apama/third_party/apache_ant
ENV LD_LIBRARY_PATH=/opt/softwareag/ApamaCapitalMarketsFoundation/lib:/opt/softwareag/ApamaCapitalMarketsFoundation/ASB/lib:/opt/softwareag/apamawork_10.0/lib:/opt/softwareag/Apama/lib:/opt/softwareag/Apama/adapters/lib:/opt/softwareag/Apama/../jvm/jvm/jre/lib/amd64/server:/opt/softwareag/Apama/../jvm/jvm/jre/lib/amd64:/opt/softwareag/Apama/third_party/python/lib:/opt/softwareag/Apama/../UniversalMessaging/cplus/lib/x86_64
ENV APAMA_LIBRARY_VERSION=10.0
ENV APAMA_CORRELATOR_HOME=/opt/softwareag/Apama
ENV APAMA_PDE_HOME=/opt/softwareag/Apama
ENV PATH=/opt/softwareag/ApamaCapitalMarketsFoundation/bin:/opt/softwareag/Apama/bin:/opt/softwareag/Apama/adapters/bin:/opt/softwareag/Apama/../jvm/jvm/jre/bin:/opt/softwareag/Apama/third_party/apache_ant/bin:/opt/softwareag/Apama/third_party/python/bin:/opt/softwareag/Apama/../jvm/jvm/jre/../bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV APAMA_JRE=/opt/softwareag/Apama/../jvm/jvm/jre
ENV APAMA_COMMON_JRE=/opt/softwareag/Apama/../jvm/jvm/jre
ENV APAMA_MANAGEMENT_HOME=/opt/softwareag/Apama
ENV APAMA_ENVSET=10.0:/opt/softwareag/Apama:amd64-rhel6
ENV APAMA_FOUNDATION_HOME=/opt/softwareag/ApamaCapitalMarketsFoundation
ENV APAMA_WORK=/opt/softwareag/apamawork_10.0
ENV APAMA_DEV_HOME=/opt/softwareag/Apama
ENV PYTHONPATH=/opt/softwareag/Apama/third_party/python/lib/python2.7/site-packages
ENV APAMA_FOUNDATION_ENVSET=10.0:/opt/softwareag/ApamaCapitalMarketsFoundation:amd64-rhel6
ENV APAMA_HOME=/opt/softwareag/Apama


# 添加apama安装文件和依赖的so文件
ADD docker/softwareag.tar.gz /opt
ADD docker/so.zip /opt

# 修改权限，配置软链
RUN cd /lib && unzip /opt/so.zip -d ./  && mv ./so/* ./ && chmod 777 ln.sh && bash ./ln.sh 

RUN cd /opt && chmod 777 -R ./softwareag && \
    sed -i 's/\/home\/gitlab-runner/\/opt/g' /opt/softwareag/Apama/bin/apama_env && \
    sed -i 's/\/home\/gitlab-runner/\/opt/g' /opt/softwareag/ApamaCapitalMarketsFoundation/bin/CMF_env
    
#修改apama文件权限
RUN chown -R root:root /opt/softwareag/*

# 启动correlator并且tail挂起
CMD /opt/softwareag/Apama/bin/correlator --name cdptest -f /opt/softwareag/Apama/command-central/instances/correlator/cdptest/logs/correlator.log -v INFO --port 15903 && tail -f /opt/softwareag/Apama/command-central/instances/correlator/cdptest/logs/correlator.log
