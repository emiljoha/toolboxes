podman pull registry.fedoraproject.org/fedora-toolbox:34

podman build -t base base
podman stop base
podman rm base
toolbox create -i localhost/base base

podman build -t python python
podman stop python
podman rm python
toolbox create -i localhost/python python
