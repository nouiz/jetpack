FROM ubuntu

RUN apt-get update

RUN apt-get -y install libboost-all-dev zlib1g-dev wget vim gcc python-dev python-setuptools libffi-dev git-core build-essential libtool automake wget

#RUN git clone git://github.com/JohnLangford/vowpal_wabbit.git
RUN wget https://github.com/JohnLangford/vowpal_wabbit/archive/7.8.tar.gz
RUN tar zxvf 7.8.tar.gz && cd /vowpal_wabbit-7.8 && ./autogen.sh && make && make install
#RUN cd /vowpal_wabbit && ./autogen.sh && make && make install

RUN ln -s /vowpal_wabbit-7.8 /vowpal_wabbit

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

RUN cd /vowpal_wabbit/cluster && ./spanning_tree

CMD ["bash"]
