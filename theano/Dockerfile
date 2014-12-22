FROM ubuntu

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update

# install basic
RUN apt-get install -y build-essential gfortran g++ libopenblas-dev git wget libxrender1 libfontconfig1 libsm6 libglib2.0-0 libfreetype6

RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh && \
    bash Miniconda-latest-Linux-x86_64.sh -b -p /opt/miniconda && \
    rm Miniconda-latest-Linux-x86_64.sh
ENV PATH /opt/miniconda/bin:$PATH
RUN chmod -R a+rx /opt/miniconda

# Install PyData modules and IPython dependencies
RUN conda update --quiet --yes conda && \
    conda install --quiet --yes numpy scipy pandas matplotlib cython pyzmq scikit-learn seaborn six statsmodels theano pip tornado jinja2 sphinx pygments nose readline sqlalchemy 

# Set up IPython kernel
RUN pip install ipython 

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN conda clean -y -t

# pylearn2
RUN git clone git://github.com/lisa-lab/pylearn2.git
RUN cd pylearn2 && python setup.py develop

# Test
RUN python -c "import numpy, scipy, pandas, matplotlib, matplotlib.pyplot, sklearn, seaborn, statsmodels, theano"

CMD ipython notebook --no-browser --ip 0.0.0.0 --port 8999
