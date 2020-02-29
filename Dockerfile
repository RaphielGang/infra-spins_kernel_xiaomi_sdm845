# Use Debian Linux Experimental
FROM debian:experimental

# We're using "docker" as Worker
ENV WORKER=docker

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        git \
        gcc \
        gcc-aarch64-linux-gnu \
        gawk \
        diffutils \
        libtool \
        binutils \
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
        default-jre-headless \
        llvm-11 \
        clang-11 && \
    apt autoremove && \
    apt autoclean

CMD ["/bin/bash"]
