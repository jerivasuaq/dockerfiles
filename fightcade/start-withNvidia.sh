#!/bin/bash

CMD=""
if [ $# -gt 0 ]; then
    CMD="--entrypoint /bin/bash -c '$@'"
fi

SND="--device /dev/snd 
	-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native 
	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native 
	-v $HOME/.config/pulse/cookie:/root/.config/pulse/cookie 
	--group-add $(getent group audio | cut -d: -f3) 
	"

	
VIDEO="
    -v /tmp/.X11-unix:/tmp/.X11-unix 
    -e DISPLAY=unix$DISPLAY 
    --device /dev/dri 
	"

DBUS="-v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm"
HOME="-v $PWD/home:/home/fightcade"

xhost + # allow connections to X server

docker run \
    -it --rm \
    --net host \
    --memory 1024mb \
	--privileged \
	$SND \
	$VIDEO \
	$DBUS \
	$HOME \
    --name fightcade-nvidia \
    $ENTRYPOINT \
	jerivas/fightcade_nvidia $CMD
    

#    -e http_proxy=localhost:3128 \

