# Use Fedora latest (30)
FROM fedora:latest

# We're using "docker" as Worker
ENV WORKER=docker

COPY che-llvm.repo /etc/yum.repos.d/

RUN dnf install -y \
        gcc-aarch64-linux-gnu \
        git-core \
        libtool \
        clang \
        binutils \
        shtool \
        which \
        hostname \
        ccache \
        bc \
        gnupg1 \
        zip \
        curl \
        make \
        m4 \
        java-latest-openjdk-headless \
    && dnf clean all

CMD ["/bin/bash"]
