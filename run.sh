case "$1" in
  graphlab)
    docker run -d -p 8997:8997 graphlab
    sleep 2 && open http://localhost:8997
  ;;
  h2o)
    docker run -d -p 8996:8996 h2o
    sleep 2 && open http://localhost8996
  ;;
  julia)
    docker run -d -p 8998:8998 julia
    sleep 2 && open http://localhost:8998
  ;;
  theano)
    docker run -d -p 8999:8999 theano
    sleep 2 && open http://localhost:8999
  ;;
  vw)
    docker run -it --rm vowpal_wabbit vw
  ;;
esac
