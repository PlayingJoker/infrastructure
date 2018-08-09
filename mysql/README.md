# 一个轻量级MySQL docker容器

## 启动方式

```
    基于docker-compose启动，请到项目目录下执行
    docker-compose up -d
```


## 目录挂载
```
    数据目录默认挂载在用户根目录下的.docker_mysql/.data文件夹中，可自行修改，容器内路径为/var/lib/mysql
```
## 默认端口
```
    默认端口为3306:3306，可修改docker-compose.yml中的ports属性
```
## 默认密码
```
    默认密码为joker_root，可通过设置环境变量${MYSQL_ROOT_PASSWORD}修改
```

默认重启策略为always
