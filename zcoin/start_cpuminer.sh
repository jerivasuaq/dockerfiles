#!/bin/bash

# https://hub.docker.com/r/jerivas/zcoin/

ENTRYPOINT=""
if [ $# -gt 0 ]; then
    if [ "$@" == "/bin/bash" ]; then
        echo "args: $@"
        ENTRYPOINT="--entrypoint $@"
    fi
fi

docker run \
    -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/home_zcoin_cpuminer:/home/zcoin_cpuminer \
    -e DISPLAY=unix$DISPLAY \
    --net host \
    --memory 512mb \
    --device /dev/snd \
    --device /dev/dri \
    --user $UID:$GID \
    --name zcoin_cpuminer \
    $ENTRYPOINT \
	jerivas/zcoin_cpuminer $CMD
    

    
