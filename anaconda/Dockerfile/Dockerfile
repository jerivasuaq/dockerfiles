FROM continuumio/anaconda3
MAINTAINER jerivas<jerivas@uaq.edu.mx>


RUN \
    apt-get update && \
    apt-get upgrade -y && \
	apt-get install -y vim build-essential

# install py3 packages
RUN /opt/conda/bin/conda install --yes notebook numpy matplotlib scipy pandas jupyter scikit-learn sympy nose seaborn

# add python 2 kernel
RUN /opt/conda/bin/conda create --yes -n py2 python=2 ipykernel
RUN /opt/conda/envs/py2/bin/ipython kernel install

# install py2 packages
RUN /opt/conda/bin/conda install --yes -n py2 notebook numpy matplotlib scipy pandas jupyter scikit-learn sympy nose seaborn

RUN \
    /opt/conda/bin/conda install -y --quiet jupyter && \
    /opt/conda/bin/conda install -y -c damianavila82 rise && \
    /opt/conda/bin/conda install -y -c conda-forge jupyterhub nbgrader 

RUN /opt/conda/bin/conda install -y -c conda-forge jupyter_contrib_nbextensions


#RUN \
#    wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py && \
#    chmod +x cpt.py && \
#    ./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/

RUN rm -rf /var/lib/apt/lists/*
RUN conda clean -t


RUN \
    mkdir  -p /srv/jupyterhub

WORKDIR "/srv/jupyterhub"

