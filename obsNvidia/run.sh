#!/bin/sh

COMMAND=/bin/bash

xhost + # allow connections to X server
docker run \
	-ti --rm \
	--net host \
	--cpuset-cpus 0 \
	--memory 512mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	--device /dev/snd \
	obs_with_nvidia_driver $COMMAND
