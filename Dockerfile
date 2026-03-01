FROM --platform=linux/amd64 debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV WINEDEBUG=-all
ENV WINEPREFIX=/home/container/.wine

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y --no-install-recommends \
        wine wine32 wine64 \
        xvfb \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 998 -s /bin/bash container
USER container
WORKDIR /home/container
