FROM  alpine:latest

LABEL org.opencontainers.image.authors="Adfinis AG <https://adfinis.com>"
LABEL org.opencontainers.image.vendor="Adfinis"


RUN   apk add --no-cache \
      bash \
      bind-tools \
      curl \
      jq \
      openssl \
      tcpdump \
      wget

CMD   ["/bin/sleep","inf"]
