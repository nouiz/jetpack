FROM ubuntu

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update

# install basic
RUN apt-get install -y build-essential gfortran g++ libopenblas-dev git

# install python and its extended packages which may be used in pylearn2
RUN apt-get install -y python python-numpy python-scipy python-dev python-pip python-nose python-yaml python-imaging python-matplotlib

# install Theano (development version)
RUN cd /opt && git clone git://github.com/Theano/Theano.git
RUN cd /opt/Theano && python setup.py develop

# install Pylearn2 (development version)
RUN cd /opt && git clone git://github.com/lisa-lab/pylearn2.git
RUN cd /opt/pylearn2 && python setup.py develop

# set Data path
RUN bash -c 'echo "export PYLEARN2_DATA_PATH=/opt/data" >> /.bashrc'

# set Scripts path
RUN bash -c 'echo "export PATH=/opt/pylearn2/pylearn2/scripts:$PATH" >> /.bashrc'
