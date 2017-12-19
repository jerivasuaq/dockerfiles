FROM jerivas/fightcade
MAINTAINER jerivas

USER root

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils module-init-tools libgl1-mesa-dri:i386 pciutils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

USER fightcade
ENV HOME /home/fightcade
WORKDIR  /home/fightcade
VOLUME /home/fightcade



