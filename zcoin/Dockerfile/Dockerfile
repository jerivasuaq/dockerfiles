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
    build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev
    
# RUN \
#     apt-get install -y software-properties-common software-properties-common \
#     add-apt-repository ppa:bitcoin/bitcoin \
#     apt-get update \
#     apt-get install libdb4.8-dev libdb4.8++-dev
#
# RUN \
#    apt-get install -y --no-install-recommends \
#    ca-certificates \
#    gconf-service \
#    hicolor-icon-theme \
#    libappindicator1 \
#    libasound2 \
#    libcanberra-gtk-module \
#    libcurl3 \
#    libexif-dev \
#    libgconf-2-4 \
#    libgl1-mesa-dri \
#    libgl1-mesa-glx \
#    libnspr4 \
#    libnss3 \
#    libpango1.0-0 \
#    libv4l-0 \
#    libxss1 \
#    libxtst6 \
#    wget \
#    xdg-utils 
#    
#RUN \
#    apt-get install -y --no-install-recommends xz-utils
#
#RUN \
#    apt-get install -y --no-install-recommends libudev-dev libudev1
#
##RUN wget -O popcorn-time.tar.xz http://popcorntime.ag/download.php?file=popcorn-time-community-v0.4.0-2-l64.tar.xz 
##RUN wget -O popcorn-time.tar.xz http://popcorntimece.ch/Downloads/Popcorn%20Time%20CE%20x64%20Linux.tar.xz
##RUN wget -O popcorn-time.tar.xz https://popcorntime.sh/download/build/Popcorn-Time-0.3.9-Linux-64.tar.xz
##RUN wget -O popcorn-time.tar.xz https://popcorntime.sh/download/build/Popcorn-Time-0.3.9-Linux-64.tar.xz
#RUN wget -O popcorn-time.tar.xz http://mirror02.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz
#
#
#RUN mkdir /opt/popcorntime/ && tar xvf popcorn-time.tar.xz -C /opt/popcorntime/
#
#RUN ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0
#
#COPY start.sh start-withNvidia.sh config.sh config-withNvidia.sh  /
#
#ENTRYPOINT [ "/opt/popcorntime/Popcorn-Time" ]
#

