#!/bin/bash

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

SND="--group-add audio --device /dev/snd "
DBUS="-v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm"
xhost + # allow connections to X server

docker run \
	-ti --rm \
	--net host \
	--memory 1024mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	-v $HOME/Downloads:/root/Downloads \
	-v $HOME/.config/google-chrome/:/data \
	$SND \
	$DBUS \
	--name popcorntime \
	$ENTRYPOINT \
	jerivas/chrome --no-sandbox
    

