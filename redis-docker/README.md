# 基于docker搭建Redis集群
```
集群方式为1个master，2个slave，3个sentinel
本地搭建为了图方便，在1台机器上做了主从，另一个机器上做了sentinel，实际应用过程中，防止灾难发生，尽量不要在同一台机器上部署
```

## 启动命令
    1. 启动node节点
        ```
            docker-compose -f redis-node.yml up -d
        ```
    2. 启动sentinel节点
        ```
            docker-compose -f redis-sentinel.yml up -d
        ```
## 配置文件修改

请自行修改yml配置文件以及conf目录下的Redis配置文件，替换为想要使用的ip地址和端口即可
在Linux机器上可能需要修改conf文件夹权限，也可以调整docker程序的用户分组和文件属性分组实现。
因为在做故障转移的时候，Redis会自行修改配置文件，比如master节点宕机之后，选举出新的master节点之后，会修改其他slave节点的slaveOf属性，调整为新的节点。
同时，原有master节点启动会，会变成新的slave节点，并增加slaveOf配置跟随新的master节点，配置文件的实时变动可保证容器随时重启不会发生主从配置错乱。

