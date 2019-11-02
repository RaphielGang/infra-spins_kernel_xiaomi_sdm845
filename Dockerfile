# Use Arch Linux latest
FROM archlinux:latest

# We're using "docker" as Worker
ENV WORKER=docker

COPY makepkg.conf /etc/makepkg.conf

RUN pacman -Syu --noconfirm \
        git \
    \
# Install other required components
    && pacman -S --noconfirm \
        aarch64-linux-gnu-gcc \
        binutils \
        which \
        ncurses \
        ccache \
        bc \
        bash \
        gnupg \
        zip \
        curl \
        make \
        automake \
        autogen \
        autoconf \
        libtool \
        python \
        m4 \
        gcc \
        libtool \
        dash \
        pigz \
        jdk-openjdk \
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
    && yes | pacman -Scc \
    && rm -fr /var/lib/pacman/sync/*

ARG _USER="android-build"
ARG _UID="1000"
RUN env && useradd -m  -u ${_UID}  ${_USER} \
    && echo "android-build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${_USER}

RUN yay -S --noconfirm clang \
    && yes | yay -Scc \
    && rm -fr /var/lib/pacman/sync/*

CMD ["/bin/bash"]
