podman build . --tag docker.io/mariolopezz/hadoop-namenode:2.7.2
podman login docker.io
podman push docker.io/mariolopezz/hadoop-namenode:2.7.2
