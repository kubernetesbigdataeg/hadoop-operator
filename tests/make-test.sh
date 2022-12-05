echo -ne "HA get state of NN0: "
kubectl exec hdfs-namenode-0 -ti -- hdfs haadmin -getServiceState nn0
echo -ne "HA get state of NN1: "
kubectl exec hdfs-namenode-0 -ti -- hdfs haadmin -getServiceState nn1
echo "HDFS DFS Admin report"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfsadmin -report
echo "HDFS DFS Admin topology"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfsadmin -printTopology
echo "HDFS create folder"
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -mkdir -p /tmp
kubectl exec hdfs-namenode-0 -ti -- hdfs dfs -ls -R /


