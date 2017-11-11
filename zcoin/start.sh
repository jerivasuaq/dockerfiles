#!/bin/bash

# https://hub.docker.com/r/jerivas/zcoin/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

echo docker run \
    -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/home_zcoin/:/home/zcoin \
    -e DISPLAY=unix$DISPLAY \
    --net host \
    --memory 512mb \
    --device /dev/snd \
    --device /dev/dri \
    --user $UID:$GID \
    --name zcoin \
    $ENTRYPOINT \
	jerivas/zcoin 
    

    
