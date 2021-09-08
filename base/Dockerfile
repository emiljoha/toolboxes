FROM registry.fedoraproject.org/fedora-toolbox:34

RUN dnf install -y git cmake emacs libtool libvterm-devel libvterm-tools fish curl meson ninja-build flatpak-builder

COPY config.fish /var/local/fish/
ENV XDG_CONFIG_HOME=/var/local

COPY base-config.el /var/local/
RUN echo "(load \"/var/local/base-config.el\")" > /var/local/init.el