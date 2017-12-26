### DOCKER ALIAS
## Sound options for RHEL7 OpenClient
snd_opts="--device /dev/snd \
	-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native:Z \
	--group-add $(getent group audio | cut -d: -f3)"

x11_opts="-e DISPLAY=unix$DISPLAY \
	--ipc=host \
	-v /dev/dri/:/dev/dri/:Z \
	-v /tmp/.X11-unix:/tmp/.X11-unix:Z"

user_opts="-u $(id -u) \
	-e USER=$USER \
	-e USERNAME=$USERNAME \
	-e LOGNAME=$LOGNAME \
	-v ~/Downloads/:/tmp/Downloads/:Z"

dbus_opts="-v /var/run/dbus:/var/run/dbus:Z \
	-v /var/run/dbus:/run/dbus:Z \
	-v /etc/machine-id:/etc/machine-id:ro \
	--net=host \
	-e DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS"

## The actual containers start here.
echo docker run --rm -it \
	--name debian \
	$snd_opt \
	$dbus_opts \
	$x11_opts \
	jess/chrome

