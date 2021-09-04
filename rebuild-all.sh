podman pull registry.fedoraproject.org/fedora-toolbox:34
podman build -t emacs-base emacs-base
podman build -t python python
podman rm base
#podman rm python
toolbox create -i localhost/emacs-base base
toolbox create -i localhost/python python
