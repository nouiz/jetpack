#!/usr/bin/env bash

usage="$(basename "$0") [package] -- run the selected package and have it connect to the outside

where:
    package - one of
                graphlab
                h2o
                julia
                theano
                vw
                mllib
"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "$usage"
    exit 1
fi

case "$1" in
  graphlab)
    echo "Please input your GraphLab Create product key:"
    read GRAPHLAB_PRODUCT_KEY
    docker run -e "GRAPHLAB_PRODUCT_KEY=$GRAPHLAB_PRODUCT_KEY" -d -p 8997:8997 startupml/graphlab
    sleep 2 && open http://localhost:8997
  ;;
  h2o)
    docker run -d -p 8996:8996 startupml/h2o
    sleep 3 && open http://localhost:8996
  ;;
  julia)
    docker run -d -p 8998:8998 startupml/julia
    sleep 2 && open http://localhost:8998
  ;;
  theano)
    docker run -d -p 8999:8999 startupml/theano
    sleep 2 && open http://localhost:8999
  ;;
  vw)
    docker run -it --rm startupml/vowpal_wabbit vw
  ;;
  mllib)
    docker run -i -t startupml/mllib /etc/bootstrap.sh -bash
  ;;
  deeplearning4j)
    docker run -i -t startupml/deeplearning4j
    #docker image cod CDH4.6 tasktracker
  ;;
esac
