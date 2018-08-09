#!/bin/bash

curl -L http://static.liuzhaoning.com/node-v8.11.3-linux-x64.tar.xz -O node-v8.11.3-linux-x64.tar.xz
docker build -t playingjoker/node8test:latest .
