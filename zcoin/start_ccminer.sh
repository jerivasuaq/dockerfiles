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
    -v $PWD/home_ccminer:/home/ccminer \
    -e DISPLAY=unix$DISPLAY \
    --net host \
    --memory 512mb \
    --name zcoin_ccminer \
    $ENTRYPOINT \
	jerivas/zcoin_ccminer $CMD
    

    
#    --user $UID:$GID \
