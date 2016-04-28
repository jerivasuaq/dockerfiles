#!/bin/bash

#xhost +
DIR=$HOME/.chromedocker
mkdir -p $DIR/pki $DIR/share $DIR/config $DIR/chrome $HOME/Downloads
[ -e $HOME/.chrome.json ] || wget https://github.com/jfrazelle/dotfiles/raw/master/etc/docker/seccomp/chrome.json -O $HOME/.chrome.json

#NAME="--name chrome"
#DIRS="-v $DIR/config:/.config -v $DIR/pki:/.pki -v $HOME/Downloads:/Downloads -v $DIR:/.local -v $DIR:/.gnome "
CPU="--cpuset-cpus 0 --memory 512mb "
SND="--group-add audio --device /dev/snd "
#PULSEAUDIO="-e PULSE_SERVER=tcp:localhost:4713 -e PULSE_COOKIE_DATA=`pax11publish -d | grep --color=never -Po '(?<=^Cookie: ).*'`"

VIDEO="--group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  "
NET="--net host"
# NVIDIA
#VIDEO="$VIDEO --device /dev/dri"
#VIDEO="$VIDEO --device /dev/video0"
DBUS="-v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm"
EXTRA="-u $(id -u):$(id -g) -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -v /var/run:/var/run"
CAPABILITY="--cap-drop all"

#USB="--device /dev/usb --device /dev/bus/usb "
#SECURITY="--security-opt seccomp:$HOME/.chrome.json"

#docker run -it  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v $HOME/Downloads:/root/Downloads -v $HOME/.config/google-chrome/:/data --device /dev/snd  --name chrome jess/chrome --user-data-dir=/data --no-sandbox
#docker --device /dev/snd  --name chrome jess/chrome --user-data-dir=/data --no-sandbox

docker run --rm -it \
        $CPU \
        $SND \
        $VIDEO \
        $USB \
	$DBUS \
	$NET \
        $CAPABILITY \
	$SECURITY \
        $NAME \
        jess/chrome \
		--user-data-dir=/.local/chrome --no-sandbox

#xhost -

