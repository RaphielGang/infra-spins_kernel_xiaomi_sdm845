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
        unzip \
        curl \
        make \
        m4 \
        pigz \
        jre-openjdk-headless \
        zstd \
    && yes | pacman -Scc \
    && rm -fr /var/lib/pacman/sync/*

RUN curl -L "https://kdrag0n.dev/files/redirector/proton_clang-latest.tar.zst" -so /root/proton-clang.tar.zst &> /dev/null && \
    cd /root/ && \
    tar -I zstd -xf /root/proton-clang.tar.zst && \
    cd /root/proton_clang* && \
    echo $(pwd)/bin > /tmp/clang_path && \
    rm -rf /root/proton-clang.tar.zst

CMD ["/bin/bash"]
