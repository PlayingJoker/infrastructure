#!/bin/bash

PROJECT_NAME=$1

wget http://nexus.td.internal/nexus/repository/files/env/jdk/jdk-8u171-linux-x64.tar.gz -c -O jdk1.8.tar.gz

echo $PROJECT_NAME

docker build -t registry.docker.td.internal/jdk1.8:latest .
