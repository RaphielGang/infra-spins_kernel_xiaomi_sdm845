# Use Fedora latest (30)
FROM fedora:latest

# We're using "docker" as Worker
ENV WORKER=docker

COPY che-llvm.repo /etc/yum.repos.d/

RUN dnf install -y \
        git \
        gcc \
        clang \
        binutils \
        which \
        hostname \
        ccache \
        bc \
        bash \
        git-core \
        gnupg \
        zip \
        curl \
        make \
        shtool \
        m4 \
        libtool \
        java-1.8.0-openjdk \
    && dnf clean all

CMD ["/bin/bash"]
