#!/bin/bash

docker run -ti --rm \
    -v /etc/localtime:/etc/localtime \
    -p 4713:4713 \
    --device /dev/snd \
    --name pulseaudio \
    jess/pulseaudio

