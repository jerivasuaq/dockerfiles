#!/bin/sh

COMMAND=obs
echo "args: $# $@ "

if [ $# -ne 0 ] ; then
    COMMAND=$@
fi


xhost + # allow connections to X server
docker run \
	-ti --rm \
	--net host \
	--cpuset-cpus 0 \
	--memory 512mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	-v="/home/jerivas/obs:/home/obs:rw"  \
	--device /dev/snd \
	obs_with_nvidia_driver $COMMAND

