FROM continuumio/anaconda3
MAINTAINER jerivas<jerivas@uaq.edu.mx>


RUN \
    apt-get update && \
    apt-get upgrade -y

RUN \
    /opt/conda/bin/conda install -y --quiet jupyter && \
    /opt/conda/bin/conda install -y -c damianavila82 rise && \
    /opt/conda/bin/conda install -c conda-forge jupyterhub nbgrader 


RUN \
    mkdir  -p /srv/jupyterhub

WORKDIR "/srv/jupyterhub"

