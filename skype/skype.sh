#!/bin/bash

docker run -it --rm \
    -v /etc/localtime:/etc/localtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --link pulseaudio:pulseaudio \
    -e PULSE_SERVER=pulseaudio \
    --name skype \
    jess/skype

