podman build . --tag docker.io/kubernetesbigdataeg/hadoop-datanode:2.7.2-1
podman login docker.io
podman push docker.io/kubernetesbigdataeg/hadoop-datanode:2.7.2-1
