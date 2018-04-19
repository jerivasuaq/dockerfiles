FROM ubuntu:16.04
MAINTAINER jerivas<jerivas@uaq.edu.mx>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]

RUN \
    apt-get update && \
    apt-get upgrade -y && \
	apt-get install -y vim build-essential cmake groff libboost-all-dev && \
    apt-get clean

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

# Install Cling
RUN cd .. && \
    wget https://root.cern.ch/download/cling/cling_2018-01-14_ubuntu16.tar.bz2 && \
    tar -xvjf cling_2018-01-14_ubuntu16.tar.bz2 && \
    rm cling_*.tar.bz2 && \
    mv cling_* cling

RUN cd .. && \
    ln -s $(pwd)/cling/bin/* /usr/bin/ && \
    cd cling/share/cling/Jupyter/kernel && \
    pip install -e . && \
    jupyter-kernelspec install cling-cpp17 && \
    jupyter-kernelspec install cling-cpp14 && \
    jupyter-kernelspec install cling-cpp11

# Install R kernel
RUN \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository ppa:chronitis/jupyter && \
    apt-get update  && \
    conda install -y -c r r-irkernel 


# Install extra packages
RUN \
    conda install -c menpo opencv && \
    conda install -c conda-forge jupyter_dashboards  && \
    conda install -c jjhelmus tensorflow 

# Install extra packages II
RUN \
    conda install -c jjhelmus tensorflow 

# Install extra packages III
RUN \
    conda install -c plotly plotly
 
# Install pdflatex support
RUN \
    apt-get install -y aptitude texlive-xetex texlive-latex-base



RUN rm -rf /var/lib/apt/lists/*
RUN conda clean -t -y



RUN \
    mkdir  -p /srv/jupyterhub

WORKDIR "/srv/jupyterhub"

