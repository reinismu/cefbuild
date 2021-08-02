FROM debian:latest
# TODO: set to debian:buster
WORKDIR /usr/build

# To avoid bricked workspaces (https://github.com/gitpod-io/gitpod/issues/1171)
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir code
RUN mkdir code/automate
RUN mkdir code/chromium_git

RUN apt-get update
RUN apt-get install -y sudo curl lsb-release
RUN apt-get install -y python 

RUN apt-get install -y \
        bison \
        curl \
        flex \
        g++-8-arm-linux-gnueabihf \
        g++-aarch64-linux-gnu \
        gcc-aarch64-linux-gnu \
        gcc-arm-linux-gnueabihf \
        git \
        gperf \
        libgtkglext1-dev \
        lsb-release \
        p7zip-full \
        python-pip \
        sudo \
        time \
        zip \
    && \
    apt-get purge -y --auto-remove \
    && \
    pip install jinja2

RUN cd code && \
    curl 'https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps.sh?format=TEXT' | base64 -d > install-build-deps.sh && \
    chmod 755 install-build-deps.sh && \
    ./install-build-deps.sh --no-arm --no-chromeos-fonts --no-nacl --no-prompt

RUN cd code && \
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

# TODO remove
ENV PATH="/usr/buildcode/depot_tools:${PATH}" 

RUN apt-get install -y wget

RUN cd code/automate && \
    wget https://bitbucket.org/chromiumembedded/cef/raw/master/tools/automate/automate-git.py

COPY scripts/update.sh /usr/build/code/chromium_git/

RUN cd code/chromium_git && \
    ./update.sh

RUN apt-get install -y libva-dev 
RUN apt-get install -y ninja-build

COPY scripts/create.sh /usr/build/code/chromium_git/chromium/src/cef

RUN cd code/chromium_git/chromium/src/cef && \
    PATH="/usr/build/code/depot_tools:${PATH}" ./create.sh
