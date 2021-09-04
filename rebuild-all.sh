podman pull registry.fedoraproject.org/fedora-toolbox:34
podman build -t emacs-base emacs-base
podman build -t golang golang
podman rm base
podman rm go
toolbox create -i localhost/emacs-base base
toolbox create -i localhost/golang go
