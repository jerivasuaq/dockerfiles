FROM jupyterhub/jupyterhub
MAINTAINER jerivas<jerivas@uaq.edu.mx>


RUN \
    apt-get update && \
    apt-get upgrade

RUN \
    conda install -y -c damianavila82 rise && \
    pip install jupyter matplotlib 

RUN \
	jupyter-nbextension install rise --py --sys-prefix && \
	jupyter-nbextension enable rise --py --sys-prefix


