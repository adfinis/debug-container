FROM alpine:latest

LABEL org.opencontainers.image.authors="Adfinis AG <https://adfinis.com>"

RUN apk add --no-cache \ 
    bash \
    jq \
    curl \
    tcpdump \
    wget \
    openssl \
    bind-tools 

ENTRYPOINT ["/bin/bash"]
