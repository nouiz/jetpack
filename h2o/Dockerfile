FROM dockerfile/java:oracle-java7

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-mirzakhani/2/h2o-2.8.3.2.zip
RUN unzip h2o-2.8.3.2.zip
RUN mv h2o-2.8.3.2 /h2o

EXPOSE 8996

ENTRYPOINT java -Xmx1g -jar /h2o/h2o.jar -port 8996
