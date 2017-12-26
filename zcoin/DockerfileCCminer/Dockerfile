FROM nvidia/cuda:9.0-devel

RUN \
    apt-get update && \
    apt-get install -y \
		wget git \
		libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential 

# Create a user to do the build
ENV BUILD_FOLDER=/minerbuild
ENV APP_FOLDER=/app
ENV APP_USER=minerbuilder
ENV CCMINER_VERSION=cuda-9

RUN adduser $APP_USER && \
    mkdir $BUILD_FOLDER && \
    chown $APP_USER.users $BUILD_FOLDER

# We'll build jansson as regular user
USER $APP_USER

# Now switch to the builder and check out the git repo
USER $APP_USER

# Clone from the git repo
RUN cd $BUILD_FOLDER && \
    git clone https://github.com/tpruvot/ccminer.git --branch $CCMINER_VERSION --single-branch

ENV CCMINER_FOLDER=$BUILD_FOLDER/ccminer

# Uncomment all the architectures

ENV CCMINER_FOLDER=$BUILD_FOLDER/ccminer

# Replace uncomment all the old architectures
RUN cd $CCMINER_FOLDER && \
    sed \
     -e 's/#nvcc_ARCH += -gencode=arch=compute_61/nvcc_ARCH += -gencode=arch=compute_61/' \
     -e 's/#nvcc_ARCH += -gencode=arch=compute_35/nvcc_ARCH += -gencode=arch=compute_35/' \
     -e 's/#nvcc_ARCH += -gencode=arch=compute_30/nvcc_ARCH += -gencode=arch=compute_30/' \
     Makefile.am > Makefile2.am
RUN cd $CCMINER_FOLDER && \
    cp Makefile2.am Makefile.am && \
    rm Makefile2.am

# Run the build
RUN cd $CCMINER_FOLDER && \
    ./build.sh

# Run the build
RUN cd $CCMINER_FOLDER && \
    ./build.sh

# Copy the ccminer binary to a /app folder
USER root

RUN mkdir $APP_FOLDER && \
    chown $APP_USER.users $APP_FOLDER && \
    cp $CCMINER_FOLDER/ccminer $APP_FOLDER

# Switch to a multistage build with the runtime image
FROM nvidia/cuda:9.0-runtime

# Redefine the app user and folder - note app folder must be the same as the first stage
ENV APP_FOLDER=/app
ENV APP_USER=ccminer

# Copy the stuff that we built
COPY --from=0 $APP_FOLDER $APP_FOLDER
COPY --from=0 /usr/local/lib /usr/local/lib

# Get the non-devel versions of the libraries that we need
RUN \
    apt-get update && \
    apt-get install -y \
	libssl1.0.0 libjansson4 automake build-essential libcurl3


RUN rm -rf /var/lib/apt/lists/*

# Symlink the app to /usr/local/bin
RUN ln -s $APP_FOLDER/ccminer /usr/local/bin/ccminer && \
    chown -R root.root $APP_FOLDER

# Recreate and switch to the app user for this build
RUN useradd -ms /bin/bash $APP_USER
RUN usermod -aG audio $APP_USER
RUN chown -R $APP_USER:$APP_USER /home/$APP_USER


USER $APP_USER
WORKDIR /home/$APP_USER
VOLUME /home/$APP_USER

ENTRYPOINT [ "ccminer" ]


