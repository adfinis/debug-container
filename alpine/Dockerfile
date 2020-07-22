FROM  alpine:latest

LABEL org.opencontainers.image.title="alpine-debug-container"
LABEL org.opencontainers.image.description="Alpine based debug container with tools for debugging networking issues and more."
LABEL org.opencontainers.image.authors="Adfinis AG <https://adfinis.com>"
LABEL org.opencontainers.image.vendor="Adfinis"
LABEL org.opencontainers.image.url="https://github.com/adfinis-sygroup/debug-container"
LABEL org.opencontainers.image.licenses="AGPL-3.0-or-later"

RUN   apk add --no-cache \
      bash \
      bind-tools \
      curl \
      jq \
      openssl \
      tcpdump \
      wget

CMD   ["/bin/sleep","inf"]
