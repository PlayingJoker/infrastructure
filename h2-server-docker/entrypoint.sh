#!/bin/bash
dir=$(dirname "$0")
#echo $dir
java -cp "$dir/h2-1.4.190.jar:$H2DRIVERS:$CLASSPATH" org.h2.tools.Server -baseDir /h2/data -tcpAllowOthers -webAllowOthers "$@" 2>&1 | tee /h2/log/db_h2_run.log
