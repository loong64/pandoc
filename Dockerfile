FROM ghcr.io/loong64/debian:trixie-slim

RUN : \
 && apt-get update \
 && apt-get install -y \
            cabal-install \
            curl \
            g++ \
            git \
 && rm -rf /var/lib/apt/lists/* \
 && :

# Clang
ARG RUNNER_ARCH
RUN : \
 && cd /opt \
 && curl -LO https://github.com/loong64/static-clang-build/raw/refs/heads/main/install-static-clang.sh \
 && bash ./install-static-clang.sh \
 && rm -f ./install-static-clang.sh \
 && :

ENV PATH="/opt/clang/bin:$PATH"

RUN git config --global --add safe.directory "*"
