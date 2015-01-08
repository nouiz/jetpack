FROM dockerfile/java:oracle-java7

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-mirzakhani/2/h2o-2.8.3.2.zip
RUN unzip h2o-2.8.3.2.zip
RUN mv h2o-2.8.3.2 /h2o

RUN wget https://s3.amazonaws.com/h2o-training/mnist/train.csv.gz && mv train.csv.gz mnist.train.csv.gz
RUN wget https://s3.amazonaws.com/h2o-training/mnist/test.csv.gz && mv test.csv.gz mnist.test.csv.gz
RUN wget https://s3.amazonaws.com/h2o-training/adult/adult.gz
RUN wget https://s3.amazonaws.com/h2o-training/higgs/higgs.100k.csv.gz

EXPOSE 8996

ENTRYPOINT java -jar /h2o/h2o.jar -port 8996 -name MyH2O
