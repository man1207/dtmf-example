FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update && apt-get install -y \
    build-essential \
    qt5-default \
    git \
    libpulse-dev \
    sox \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/EliasOenal/multimon-ng.git \
    && cd multimon-ng \
    && mkdir build \
    && cd build \
    && qmake ../multimon-ng.pro \
    && make \
    && make install

ENTRYPOINT ["multimon-ng"]
