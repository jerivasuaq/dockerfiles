docker run -it \
	--device /dev/snd \
	-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
	-v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
	--group-add $(getent group audio | cut -d: -f3) \
	jerivas/test_sound aplay /usr/share/sounds/alsa/Front_Center.wav 

