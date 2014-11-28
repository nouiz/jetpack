FROM ubuntu

RUN apt-get update

RUN apt-get -y install zlib1g-dev wget vim gcc python-dev python-setuptools libffi-dev git-core build-essential libtool automake julia

#RUN apt-get update

RUN easy_install -U pip
RUN pip install ipython

RUN julia --eval 'Pkg.add("IJulia")'
RUN julia --eval 'Pkg.add("Gadfly")'

EXPOSE 8998

RUN ipython notebook --profile julia

WORKDIR /data

#COPY workshop workshop
