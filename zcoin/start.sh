#!/bin/bash

# https://hub.docker.com/r/jerivas/zcoin/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

docker run \
    -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/home_zcoinqt/:/home/zcoinqt \
    -e DISPLAY=unix$DISPLAY \
    --net host \
    --memory 512mb \
    --device /dev/snd \
    --device /dev/dri \
    --name zcoinqt \
    $ENTRYPOINT \
	jerivas/zcoinqt
    

#    --user $UID:$GID \
    
