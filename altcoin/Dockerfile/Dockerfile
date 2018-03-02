FROM debian:stretch as builder
MAINTAINER jerivas<jerivas.qro@gmail.com>


ENV APP_USER=zcoinqt


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

#RUN wget -O litecoin.zip https://github.com/litecoin-project/litecoin/archive/master.zip && \
#    DB4_PREFIX="/opt/db4" && \
#    unzip litecoin.zip -d /opt/ && cd /opt/litecoin-master && \
#    ./autogen.sh && ./configure LDFLAGS="-L${DB4_PREFIX}/lib/" CPPFLAGS="-I${DB4_PREFIX}/include/" && \
#    make


#FROM debian:stretch-slim 
#
ENV APP_USER=litecoin
#
#RUN \
#    apt-get update && \
#    apt-get install -y \
#		libzmq5 libboost-system1.62.0 libboost-filesystem1.62.0 libboost-program-options1.62.0 libboost-thread1.62.0 libboost-chrono1.62.0 \
#		libqt5network5 libqt5widgets5 libqrencode3 libprotobuf10 libssl1.1 libminiupnpc10 libevent-pthreads-2.0-5 libevent-2.0-5
#


RUN \
    apt-get install -y vim git
 

RUN useradd -ms /bin/bash $APP_USER
RUN usermod -aG audio $APP_USER
RUN chown -R $APP_USER:$APP_USER /home/$APP_USER

WORKDIR /home/$APP_USER
#
#
#COPY --from=builder /opt/zcoin-master/src/qt/zcoin-qt /usr/bin/zcoin-qt
#

USER $APP_USER
VOLUME /home/$APP_USER
VOLUME /opt
ENV PULSE_SERVER unix:/tmp/pulse




# ENTRYPOINT [ "zcoin-qt" ]




