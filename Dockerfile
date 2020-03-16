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
        software-properties-common \
        wget && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://apt.llvm.org/unstable/ llvm-toolchain         main" && \
    apt update && \
    apt install -y \
        lld-11 \
        llvm-11 \
        clang-11 && \
    apt autoremove -y && \
    apt autoclean -y

CMD ["/bin/bash"]
