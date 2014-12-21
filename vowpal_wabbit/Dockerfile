FROM ubuntu

RUN apt-get update

RUN apt-get -y install libboost-all-dev zlib1g-dev wget vim gcc python-dev python-setuptools libffi-dev git-core build-essential libtool automake

RUN git clone git://github.com/JohnLangford/vowpal_wabbit.git

RUN cd /vowpal_wabbit && ./autogen.sh && make && make install

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
