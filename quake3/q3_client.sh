#!/bin/bash

ARGS="+connect q3srv:27960"

if [ $# -gt 0 ]
then
	ARGS=$@
fi
ARGS=

LINK="--link q3srv:q3srv"
LINK=""

nvidia-docker run                                  \
	-ti --rm                                    \
	--device=/dev/dri                       \
	--device=/dev/snd                       \
	--privileged								\
	$LINK									\
	-e DISPLAY=unix$DISPLAY                     \
	-v $HOME/.q3a:/home/unamedplayer/.q3a   \
	-v $HOME/.q3a/baseq3/PAK0.PK3:/pak0.pk3          \
	-v /tmp/.X11-unix:/tmp/.X11-unix        \
		--device /dev/nvidia0:/dev/nvidia0 \
		--device /dev/nvidiactl:/dev/nvidiactl \
		--entrypoint=/bin/bash \
       icecrime/ioquake3 $ARGS



