FROM debian:stretch-slim
MAINTAINER jerivas<jerivas@uaq.edu.mx>

# Partially based on http://forum.arcadecontrols.com/index.php?topic=144185.0
# https://github.com/poliva/pyqtggpo/blob/master/linux-install.sh

RUN \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libgtk2.0-0:i386 libnss3 libgconf-2-4 libasound2-plugins libnotify4 \
	alsa-utils pulseaudio \
	wget

#ubuntu
#    libgtk2.0-0:i386 libnss3 libgconf-2-4 libasound2-plugins-extra libnotify4 \

RUN apt-get install -y --no-install-recommends xz-utils

RUN apt-get install -y --no-install-recommends libudev-dev libudev1

RUN apt-get install -y --no-install-recommends wine wine32 python-qt4-phonon python-qt4

RUN wget -O fightcade.tgz http://www.fightcade.com/download/linux

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/fightcade/ && tar xvf fightcade.tgz -C /opt/fightcade/

RUN /opt/fightcade/FightCade/linux-install.sh


RUN useradd -ms /bin/bash fightcade
RUN usermod -aG audio fightcade

USER fightcade
ENV HOME /home/fightcade
WORKDIR  /home/fightcade
VOLUME /home/fightcade


#RUN ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0

#COPY start.sh start-withNvidia.sh config.sh config-withNvidia.sh  /

ENTRYPOINT [ "/bin/bash" ]
#CMD [ "/opt/fightcade/FightCade/fightcade" ]


