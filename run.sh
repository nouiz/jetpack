case "$1" in
  julia)
    docker run -d -p 8998:8998 julia
    sleep 2 && open http://localhost:8998
  ;;
  theano)
    docker run -d -p 8999:8999 theano
    sleep 2 && open http://localhost:8999
  ;;
  graphlab)
    docker run -d -p 8997:8997 graphlab
    sleep 2 && open http://localhost:8997
  ;;
  vw)
    docker run -it --rm vowpal_wabbit vw
  ;;
esac
