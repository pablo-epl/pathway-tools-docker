FROM --platform=linux/amd64 ubuntu:18.04

ARG PT_VERSION

ENV DEBIAN_FRONTEND=noninteractive \
    PT-VERSION=${PT_VERSION}

RUN apt-get update && \
    apt-get install -y xterm openssl vim less wget libxm4 libssl1.0.0

COPY config/ptools-init.dat /opt/data/ptools-local/ptools-init.dat
COPY config/install-pathway-tools.sh /opt/bin/install-pathway-tools.sh
COPY pathway-tools-install/pathway-tools-$PT_VERSION-linux-64-tier1-install /opt/bin/pathway-tools-$PT_VERSION-linux-64-tier1-install

RUN chmod +x /opt/bin/pathway-tools-$PT_VERSION-linux-64-tier1-install
RUN /opt/bin/install-pathway-tools.sh

COPY config/run-pathway-tools.sh /opt/bin/run-pathway-tools.sh

CMD [ "/opt/bin/run-pathway-tools.sh" ]
