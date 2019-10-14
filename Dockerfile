# Use Fedora Rawhide
FROM fedora:rawhide

# We're using "docker" as Worker
ENV WORKER=docker

COPY llvm-git.repo /etc/yum.repos.d/

RUN dnf install -y \
        git \
        dnf-plugins-core \
        copr-cli \
    \
# Remove beignet and pocl as copr required it
    && dnf remove -y beignet pocl \
    \
# Enable LLVM Copr for Clang
    && dnf copr enable -y \
    xxmitsu/llvm \
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
        pigz

CMD ["/bin/bash"]