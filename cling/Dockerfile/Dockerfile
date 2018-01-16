FROM continuumio/anaconda3
MAINTAINER jerivas<jerivas@uaq.edu.mx>


RUN \
    apt-get update && apt-get install -y build-essential

# Install Cling
RUN \
    cd /root/ && \
    wget https://cmake.org/files/v3.10/cmake-3.10.1-Linux-x86_64.tar.gz -O cmake.tgz && \
    tar xvf cmake.tgz && \
    export PATH="$PATH:/root/cmake/cmake-3.10.1-Linux-x86_64/bin" 

RUN \
    cd /root/ && \
    export PATH="$PATH:/root/cmake/cmake-3.10.1-Linux-x86_64/bin" && \
    wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py && \
    chmod +x cpt.py && \
    ./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/ 

RUN cd .. && \
    ln -s $(pwd)/cling/bin/* /usr/bin/ && \
    cd cling/share/cling/Jupyter/kernel && \
    pip install -e . && \
    jupyter-kernelspec install cling-cpp17 && \
    jupyter-kernelspec install cling-cpp14 && \
    jupyter-kernelspec install cling-cpp11

WORKDIR "/root"

