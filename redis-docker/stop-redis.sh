#!/bin/bash
docker ps|grep redis|awk '{print $1}'|xargs docker stop|xargs docker rm
