FROM registry.fedoraproject.org/fedora-toolbox:34

RUN dnf install -y git cmake emacs libtool libvterm-devel libvterm-tools fish curl meson ninja-build

RUN echo "(load \"/var/home/emil/dev/emacs-config/init.el\")" > /var/local/init.el