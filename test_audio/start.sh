


SND="--device /dev/snd 
	-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native 
	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native 
	-v $HOME/.config/pulse/cookie:/root/.config/pulse/cookie 
	--group-add $(getent group audio | cut -d: -f3) 
	"

docker run -it \
		$SND \
		jerivas/test_sound aplay /usr/share/sounds/alsa/Front_Center.wav 

