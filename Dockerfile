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
        inetutils \
        gawk \
        diffutils \
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
        clang \
    && yes | pacman -Scc \
    && rm -fr /var/lib/pacman/sync/*

CMD ["/bin/bash"]
