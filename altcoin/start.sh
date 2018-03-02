#!/bin/bash

# https://hub.docker.com/r/jerivas/zcoin/

if [ $# -gt 0 ]; then
    ENTRYPOINT="--entrypoint $@"
fi

HOME_GEEKCOIN="/media/jerivas/media/deleteme/litecoin/home"
OPT_GEEKCOIN="/media/jerivas/media/deleteme/litecoin/opt"

docker run \
    -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME_GEEKCOIN:/home/geekcoin:rw \
    -v $OPT_GEEKCOIN:/opt:rw \
    --user $UID:$GID \
    --net host \
    --memory 512mb \
    --device /dev/snd \
    --device /dev/dri \
    --name litecoin \
    $ENTRYPOINT \
	jerivas/geekcoin
    

    
