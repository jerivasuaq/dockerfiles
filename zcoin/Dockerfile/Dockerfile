# Base docker image
# docker run -ti --rm jerivas/zcoin /config > zcoin.sh
# chmod +x zcoin.sh
# dos2unix zcoin.sh
# ./zcoin.sh
# ```
# 
# The next time do:
# 
# ```
# docker start zcoin
# ```
# 
# RUN zcoin.sh


FROM debian
MAINTAINER jerivas<jerivas.qro@gmail.com>


RUN \
    apt-get update && \
    apt-get install -y \
    build-essential libtool autotools-dev automake pkg-config libssl-dev \
        libevent-dev bsdmainutils libboost-all-dev wget unzip
    
RUN \
    apt-get install -y libminiupnpc-dev libzmq3-dev \
        libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools \
        libprotobuf-dev protobuf-compiler libqrencode-dev


# INTALLING BERKELEY DB
# https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md#berkeley-db
RUN cd /opt/ && BITCOIN_ROOT=$(pwd) && \
    DB4_PREFIX="${BITCOIN_ROOT}/db4" && \
    mkdir -p $DB4_PREFIX && \
    wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz' && \
    echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c && \
    tar -xzvf db-4.8.30.NC.tar.gz && \
    cd db-4.8.30.NC/build_unix/ && \
    ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$DB4_PREFIX && \
    make install

RUN wget -O zcoin.zip https://github.com/zcoinofficial/zcoin/archive/master.zip && \
    DB4_PREFIX="/opt/db4" && \
    unzip zcoin.zip -d /opt/ && cd /opt/zcoin-master && \
    ./autogen.sh && ./configure LDFLAGS="-L${DB4_PREFIX}/lib/" CPPFLAGS="-I${DB4_PREFIX}/include/" && \
    make


RUN useradd -ms /bin/bash zcoin
RUN usermod -aG audio zcoin
RUN chown -R zcoin:zcoin /home/zcoin

WORKDIR /home/zcoin

USER zcoin
ENV HOME /home/zcoin
VOLUME /home/zcoin
ENV PULSE_SERVER unix:/tmp/pulse





ENTRYPOINT [ "/opt/zcoin-master/src/qt/zcoin-qt" ]

