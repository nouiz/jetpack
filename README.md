#Docker Images for Machine Learning Tools

Machine learning tools are notorious for having byzantine dependencies and often academic code quality. This makes them hard to install and configure correctly across different machines and operating systems.  At  [Startup.ML](http://startup.ml/) we have been using Docker to simplify the process of getting these tools on our machines.

## Currently supported tools

* Deeplearning4J
* GraphLab
* Julia
* Theano
* Torch7
* Spark MLlib
* Vowpal Wabbit (VW)

## Getting started
* First step is to [Install Docker on Mac OS X](https://github.com/boot2docker/osx-installer/releases/download/v1.4.1/Boot2Docker-1.4.1.pkg). 
* Once Boot2Docker has been installed, launch it from Spotlight
* In the terminal window with the title "Boot2Docker for OSX" go to the jetpack directory and start the build process

```
./build.sh julia (or theano, graphlab, torch7, spark ...)
```

or to build all tools

```
./build.sh 
```

to run the docker image

```
./run.sh julia (or theano, graphlab, torch7, spark ...)
```

