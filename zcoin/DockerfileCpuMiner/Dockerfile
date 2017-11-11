# RUN start_cpuminer.sh


FROM debian:jessie-slim
MAINTAINER jerivas<jerivas.qro@gmail.com>


# Based on https://github.com/zcoinofficial/cpuminer-xzc

RUN \
    apt-get update && \
    apt-get install -y \
        git automake autoconf pkg-config libcurl4-openssl-dev \
        libjansson-dev libssl-dev libgmp-dev \
    wget unzip
    
RUN \
    apt-get install -y \
        build-essential

WORKDIR /opt
# LDFLAGS="-L${DB4_PREFIX}/lib/" CPPFLAGS="-I${DB4_PREFIX}/include/" 


RUN \
    git clone https://github.com/zcoinofficial/cpuminer-xzc && \
    cd /opt/cpuminer-xzc && \
    ./autogen.sh && ./configure CFLAGS="-march=native" --with-crypto --with-curl && \
    make && make install

RUN rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash zcoin_cpuminer
RUN usermod -aG audio zcoin_cpuminer
RUN chown -R zcoin_cpuminer:zcoin_cpuminer /home/zcoin_cpuminer

WORKDIR /home/zcoin_cpuminer

USER zcoin_cpuminer
ENV HOME /home/zcoin_cpuminer
VOLUME /home/zcoin_cpuminer
ENV PULSE_SERVER unix:/tmp/pulse




ENTRYPOINT [ "/opt/cpuminer-xzc/cpuminer" ]






