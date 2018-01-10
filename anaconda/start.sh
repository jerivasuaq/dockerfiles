#!/bin/bash

CONTAINER_IMAGE=jerivas/anaconda
CONTAINER_WEB=anaconda

WEB_PORT=8888

echo ""
echo ""
echo ""
echo "make sure $CONTAINER_DB container is running"
echo "<<<<<<<<<<<<<<<<<Access to web interface http://localhost:$WEB_PORT >>>>>"
echo ""
echo ""
echo ""
sleep 1

RUNMODE="-d --restart=unless-stopped"
RUNMODE="--rm -ti "

CMD=""
#CMD="jupyterhub"

if [[ "$#" -gt 0 ]] ; then

    re='^[0-9]+$'
    if [[ "$1" =~ $re ]] ; then
        CMD="$2"
        RUNMODE="-ti --rm"
        NAME=""
        PORTS="$1:8888"
        echo "Starting server on port $1...."
        echo ""
        echo ""
        echo ""
    else
        echo "Start with jupyterhub"
        echo
        CMD=$@
        RUNMODE="-ti --rm"
        NAME=""
    fi
fi

#    -v `pwd`/home:/home \
#    -v `pwd`/etc:/etc \
#    -v `pwd`/jupyterhub:/srv/jupyterhub \

docker run \
    $RUNMODE \
    -p $WEB_PORT:8000 \
    --name $CONTAINER_WEB \
    $CONTAINER_IMAGE $CMD
     
#    -ti \

