#
# root docker container base on root (6.12)
# build over an ubuntu (16.04)
#
FROM rootproject/root-ubuntu16:latest

LABEL author="nuria.castello.mor@gmail.com" \
    version="1.0" \
    description="Docker image to run root version 6.12"

USER 0

# uid (-u) and group IDs (-g) are fixed to 1000 to be used for development
# purposes
# FIXME: 1000 change this number for your linux number ID ($ id -u $USER where $USER is your linux
# user name)
RUN useradd -u 1000 -md /home/rootuser -ms /bin/bash -G builder,sudo rootuser \
    && echo "rootuser:docker" | chpasswd \
    && echo "rootuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Correct base image to include ROOT python module
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/lib/root"
# Include ROOT libraries
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib/root"

RUN apt-get update && apt-get -y install \
	    qt4-dev-tools \
        libxerces-c-dev \
        libgl1-mesa-dev \
        libxmu-dev \
        libmotif-dev \
        libexpat1-dev \
        libboost-all-dev \
        xfonts-75dpi \
        xfonts-100dpi \
        imagemagick \
        wget \
        vim \
        tk \
        ipython \
        python-numpy \
        python-scipy \
        python-matplotlib \
        libboost-python-dev \
        subversion \
        subversion-tools \
        # here insert your libraries, packages that you think you will need
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/rootuser/workdir
USER rootuser

ENV setrootenv="/usr/local/bin/root/thisroot.sh"

ENTRYPOINT ["/bin/bash"]

