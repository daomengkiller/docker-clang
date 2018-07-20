FROM debian:stable

# Install dependencies
RUN apt-get -qq update; \
    apt-get install -qqy --no-install-recommends \
        autoconf automake cmake dpkg-dev file make patch libc6-dev \
        dirmngr gnupg2 lbzip2 wget xz-utils; \
    rm -rf /var/lib/apt/lists/*

# Signing keys
ENV GPG_KEYS 09C4E7007CB2EFFB A2C794A986419D8A B4468DF4E95C63DC D23DD2C20DD88BA2 8F0871F202119294

# Retrieve keys
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys $GPG_KEYS

# Version info
ENV LLVM_RELEASE 6
ENV LLVM_VERSION 6.0.1

# Install Clang and LLVM
COPY install.sh .
RUN ./install.sh
