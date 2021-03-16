FROM ubuntu:20.04

ARG TAG
ARG WITH_GUI
ARG WITH_ELECTRON

ARG DEBIAN_FRONTEND=noninteractive

# Mainnet incoming peer connections
EXPOSE 8444/tcp
# Testnet incoming peer connections
EXPOSE 58444/tcp
# GUI
EXPOSE 3000/tcp

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    bc \
    ca-certificates \
    git \
    lsb-release \
    sudo \
    tzdata \
  && if [ "$WITH_ELECTRON" = "1" ] ; then \
    apt-get install -y --no-install-recommends \
      libasound2 \
      libatk1.0-0 \
      libatk-bridge2.0-0 \
      libgbm1 \
      libgdk-pixbuf2.0-0 \
      libgtk-3-0 \
      libnss3 \
    ; fi \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN git clone -b "${TAG}" https://github.com/Chia-Network/chia-blockchain.git .

RUN sh install.sh

RUN if [ "$WITH_GUI" = "1" ] ; then \
    . ./activate \
    && DEBIAN_FRONTEND=noninteractive sh install-gui.sh \
  ; fi

COPY docker/entrypoint.sh docker/entrypoint.sh
ENTRYPOINT ["/app/docker/entrypoint.sh"]
CMD ["chia"]

