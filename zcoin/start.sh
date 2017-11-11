#!/bin/bash

# https://hub.docker.com/r/jerivas/zcoin/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

docker run \
    -it --rm \
    --net host \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/zcoin/:/home/zcoin \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --device /dev/dri \
    --name zcoin \
    $ENTRYPOINT \
	jerivas/zcoin 
    

#    -e http_proxy=localhost:3128 \
    
