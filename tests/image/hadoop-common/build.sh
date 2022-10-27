podman build . --tag docker.io/kubernetesbigdataeg/hadoop:2.7.2-1
podman login docker.io -u kubernetesbigdataeg
podman push docker.io/kubernetesbigdataeg/hadoop:2.7.2-1
