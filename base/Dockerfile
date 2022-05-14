FROM registry.fedoraproject.org/fedora-toolbox:34

RUN dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

RUN dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

RUN dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

RUN dnf groupupdate sound-and-video -y

RUN dnf install -y git cmake emacs libtool libvterm-devel libvterm-tools fish curl meson ninja-build flatpak-builder

COPY config.fish /var/local/fish/

COPY base-config.el /var/local/
RUN echo "(load \"/var/local/base-config.el\")" > /var/local/init.el