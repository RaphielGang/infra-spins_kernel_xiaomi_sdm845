# Use Debian Linux Experimental
FROM debian:experimental

# We're using "docker" as Worker
ENV WORKER=docker

RUN apt update && \
    apt upgrade && \
    apt install \
        git \
        aarch64-linux-gnu-gcc \
        inetutils \
        gawk \
        diffutils \
        libtool \
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
        clang

CMD ["/bin/bash"]
