FROM ubuntu:precise
MAINTAINER joshjdevl < joshjdevl [at] gmail {dot} com>

RUN apt-get update && apt-get -y install python-software-properties software-properties-common
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get update

RUN add-apt-repository ppa:apt-fast/stable
RUN apt-get update
RUN apt-get -y install apt-fast

RUN apt-fast -y install wget
RUN apt-fast update
RUN apt-fast install -y openssh-server
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
RUN echo "root:josh" | chpasswd

RUN apt-fast -y install gcc g++ build-essential libopenmpi-dev openmpi-bin default-jdk cmake zlib1g-dev git vim
RUN apt-fast -y install python-dev python-pip

RUN mkdir /graphlab && git clone https://github.com/graphlab-code/graphlab.git
ADD CMakeLists.txt.patch /graphlab/CMakeLists.txt.patch
RUN cd /graphlab && patch < CMakeLists.txt.patch
RUN cd /graphlab && ./configure
RUN pip install GraphLab-Create

RUN cd /graphlab/release && make -j 2
RUN cd /graphlab/release && make install

RUN pip install --upgrade graphlab-create
