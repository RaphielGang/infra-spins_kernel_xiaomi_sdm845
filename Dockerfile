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
        inetutils \
        gawk \
        libtool \
        gcc \
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
        python \
        m4 \
        dash \
        pigz \
        jre-openjdk-headless \
    && curl 'https://raw.githubusercontent.com/archlinuxcn/mirrorlist-repo/master/archlinuxcn-mirrorlist' \
        | sed 's/^#Server/Server/' > /etc/pacman.d/archlinuxcn-mirrorlist \
    && echo '[archlinuxcn]' >> /etc/pacman.conf \
    && echo 'SigLevel = Optional TrustedOnly' >> /etc/pacman.conf \
    && echo 'Include = /etc/pacman.d/archlinuxcn-mirrorlist' >> /etc/pacman.conf \
    && pacman -Syy \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -S --noconfirm archlinuxcn-keyring \
    && pacman -S --noconfirm clang \
    && yes | pacman -Scc \
    && rm -fr /var/lib/pacman/sync/*

CMD ["/bin/bash"]
