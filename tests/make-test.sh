echo -ne "##### HA get state of NN0: "
kubectl exec hdfs-namenode-0 -ti -- hdfs haadmin -getServiceState nn0
echo -ne "##### HA get state of NN1: "
kubectl exec hdfs-namenode-0 -ti -- hdfs haadmin -getServiceState nn1
echo "##### HDFS DFS Admin report #####"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfsadmin -report
echo "##### HDFS DFS Admin topology #####"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfsadmin -printTopology
echo "##### HDFS create folder #####"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -mkdir -p /tmp
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -ls -R /
echo "##### HDFS creating 10M file #####"
kubectl exec hdfs-namenode-0 -ti -- sh -c "(head -c 100M < /dev/urandom > /tmp/random-10M)"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -copyFromLocal /tmp/random-10M /tmp
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -ls /tmp
echo "##### HDFS deleting /tmp folder (ho trash) #####"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -rm -r -skipTrash /tmp


