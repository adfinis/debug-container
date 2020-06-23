FROM alpine:latest

LABEL org.opencontainers.image.authors="Adfinis AG <https://adfinis.com>"

RUN apk add --no-cache \ 
    bash \
    bind-tools \
    curl \
    jq \
    openssl \
    tcpdump \
    wget

ENTRYPOINT ["/bin/bash"]
