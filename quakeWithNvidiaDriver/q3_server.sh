#!/bin/bash

docker run                              \
       --name q3srv                        \
       --rm -ti                            \
       -v /home/jerivas/.q3a/baseq3/PAK0.PK3:/pak0.pk3      \
	   -p 27950:27950 \
	   -p 27952:27952 \
	   -p 27960:27960/udp \
       icecrime/ioquake3 server +map q3tourney2

#       -v $HOME/.q3a:/unamedplayer/.q3a    \
