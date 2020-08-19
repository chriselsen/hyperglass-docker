FROM ubuntu
RUN apt-get update \
    && apt-get install -y python3-dev \
    && apt-get install -y python3-pip \
    && apt-get install -y redis-server \
    && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && apt-get update \
    && apt-get install -y nodejs \
    && pip3 install hyperglass \
    && npm install --global yarn
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /usr/local/bin
VOLUME [ "/etc/hyperglass", "/etc/hyperglass" ]

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "/bin/bash" ]
