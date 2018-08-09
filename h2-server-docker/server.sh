#!/bin/bash
dir=$(dirname "$0")
#echo $dir
nohup java -cp "$dir/h2-1.4.190.jar:$H2DRIVERS:$CLASSPATH" org.h2.tools.Server -tcpAllowOthers -webAllowOthers -webPort 8082 "$@" > db_h2_run.log 2>&1 &
