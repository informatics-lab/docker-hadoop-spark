#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -test -d /spark
if [ $? != 0 ]
then
  $HADOOP_HOME/bin/hdfs dfs -put $SPARK_HOME-1.6.0-bin-hadoop2.6/lib /spark
else
  echo "Spark already on HDFS"
fi

spark-shell --master yarn-client
