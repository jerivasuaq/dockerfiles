FROM icecrime/ioquake3
MAINTAINER jerivas

USER root

RUN apt-get update
RUN apt-get install -y mesa-utils module-init-tools

# install nvidia driver
RUN apt-get install -y binutils
ADD NVIDIA-DRIVER.run /NVIDIA-DRIVER.run
RUN chmod +x /NVIDIA-DRIVER.run && sh /NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module &&  rm /NVIDIA-DRIVER.run

USER unamedplayer
ENTRYPOINT ["/entrypoint.sh"]


