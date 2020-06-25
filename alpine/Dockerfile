FROM alpine:latest

LABEL org.opencontainers.image.title="alpine-debug-container" \
      org.opencontainers.image.description="Alpine based debug container with tools for debugging networking issues and more." \
      org.opencontainers.image.authors="Adfinis AG <https://adfinis.com>" \
      org.opencontainers.image.vendor="Adfinis" \
      org.opencontainers.image.url="https://github.com/adfinis-sygroup/debug-container" \
      org.opencontainers.image.licenses="AGPL-3.0-or-later"

ADD entrypoint.sh /entrypoint.sh

RUN apk add --no-cache \ 
    bash \
    bind-tools \
    curl \
    jq \
    openssl \
    tcpdump \
    wget && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
