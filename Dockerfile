# Use Arch Linux latest
FROM archlinux:latest

# We're using "docker" as Worker
ENV WORKER=docker

COPY makepkg.conf /etc/makepkg.conf

RUN pacman -Syu --noconfirm \
        git \
        base-devel \
    \
# Install other required components
    && pacman -S --noconfirm \
        aarch64-linux-gnu-gcc \
    && curl 'https://raw.githubusercontent.com/archlinuxcn/mirrorlist-repo/master/archlinuxcn-mirrorlist' \
        | sed 's/^#Server/Server/' > /etc/pacman.d/archlinuxcn-mirrorlist \
    && echo '[archlinuxcn]' >> /etc/pacman.conf \
    && echo 'SigLevel = Optional TrustedOnly' >> /etc/pacman.conf \
    && echo 'Include = /etc/pacman.d/archlinuxcn-mirrorlist' >> /etc/pacman.conf \
    && pacman -Syy \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -S --noconfirm archlinuxcn-keyring \
    && pacman -S --noconfirm yay-git \
    && pacman -Scc

ARG _USER="android-build"
ARG _UID="1000"
RUN env && useradd -m  -u ${_UID}  ${_USER} \
    && echo "android-build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${_USER}

RUN yay -S --noconfirm clang \
    && yay -Scc --noconfirm

CMD ["/bin/bash"]
