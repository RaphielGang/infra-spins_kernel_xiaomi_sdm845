# Use Fedora latest (30)
FROM fedora:latest

# We're using "docker" as Worker
ENV WORKER=docker

COPY che-llvm.repo /etc/yum.repos.d/

RUN dnf install -y \
        git \
        dnf-plugins-core \
        copr-cli \
    \
# Remove beignet and pocl as copr required it
    && dnf remove -y beignet pocl \
    \
# Install other required components
    && dnf install -y \
        gcc-aarch64-linux-gnu \
        clang \
        binutils \
        which \
        hostname \
        ncurses \
        ccache \
        bc \
        bash \
        git-core \
        gnupg \
        zip \
        curl \
        make \
        automake \
        autogen \
        autoconf \
        libtool \
        shtool \
        python \
        m4 \
        gcc \
        libtool \
        dash \
        pigz \
        java-1.8.0-openjdk

CMD ["/bin/bash"]
