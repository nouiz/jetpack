FROM centos:centos6

MAINTAINER Adam Gibson
RUN yum -y install lzo lzo-devel blas sudo wget git tar && wget http://mirror.symnds.com/software/Apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN tar xzvf apache-maven-3.2.5-bin.tar.gz
RUN mv apache-maven-3.2.5 /opt/mvn
RUN export PATH=$PATH:/opt/mvn/bin
RUN wget -q -O /tmp/jdk-7u67-linux-x64.rpm --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm
RUN yum -y localinstall /tmp/jdk-7u67-linux-x64.rpm
RUN rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
COPY inst/cdh4.repo /etc/yum.repos.d/cdh4.repo
COPY inst/cloudera-gplextras4.repo /etc/yum.repos.d/cloudera-gplextras4.repo
RUN yum -y install hadoop hadoop-client  hadoop-yarn-resourcemanager hadoop-lzo-cdh4
RUN rm -rf hadoop-example-native && git clone https://github.com/SkymindIO/hadoop-example-native.git
RUN cd hadoop-example-native && cp -rf src/main/resources/data/iris_out.txt /tmp
RUN cd hadoop-example-native && /opt/mvn/bin/mvn clean install -DskipTests 
RUN cd hadoop-example-native && mv target/hadoop-example-1.0-SNAPSHOT-bin.tar.gz .. 
RUN cd .. && tar xvf hadoop-example-1.0-SNAPSHOT-bin.tar.gz && mkdir hadoop-lib 
RUN mv hadoop-example-1.0-SNAPSHOT/lib ./hadoop-lib 
RUN cp -rf hadoop-example-native/target/*.jar hadoop-lib/lib
RUN cp -rf hadoop-example-native/src/main/resources/* hadoop-lib/lib/ 
RUN rm /etc/hadoop/conf
RUN mkdir /etc/hadoop/conf
RUN mkdir /data
RUN chmod 777 /data
COPY inst/run.sh /run.sh
RUN ls hadoop-example-native/src/main/resources/
RUN java -cp "hadoop-lib/lib/*" org.deeplearning4j.App /hadoop-example-native/src/main/resources/conf/ir.properties
ENTRYPOINT ["/bin/bash", "/run.sh" ]
EXPOSE 50060
