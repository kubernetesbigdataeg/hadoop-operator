#!/bin/bash

source /etc/environments/hadoop.env
rm -f /etc/hadoop-custom-conf/core-site.xml /etc/hadoop-custom-conf/hdfs-site.xml
./propgen -label HADOOP -render coresite -file /etc/hadoop-custom-conf/core-site.xml
./propgen -label HADOOP -render hdfssite -file /etc/hadoop-custom-conf/hdfs-site.xml

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME 
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode