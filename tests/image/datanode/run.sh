#!/bin/bash

source /etc/environments/hadoop.env
rm -f /etc/hadoop-custom-conf/core-site.xml /etc/hadoop-custom-conf/hdfs-site.xml
./propgen -label HADOOP -render coresite -file /etc/hadoop-custom-conf/core-site.xml
./propgen -label HADOOP -render hdfssite -file /etc/hadoop-custom-conf/hdfs-site.xml

datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode