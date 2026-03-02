FROM --platform=linux/amd64 debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV WINEDEBUG=-all
ENV WINEPREFIX=/home/container/.wine
ENV DISPLAY=:99

RUN apt-get update && apt-get install -y --no-install-recommends \
        wine64 \
        xvfb \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/.X11-unix \
    && chmod 1777 /tmp/.X11-unix

RUN useradd -m -u 998 -s /bin/bash container

COPY --chown=container:container startup.sh /startup.sh
RUN chmod +x /startup.sh

USER container
WORKDIR /home/container

ENTRYPOINT ["/startup.sh"]
