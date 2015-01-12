FROM centos:centos6

MAINTAINER Adam Gibson

RUN yum -y install lzo lzo-devel blas sudo wget git
RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven
RUN wget -q -O /tmp/jdk-7u67-linux-x64.rpm --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm
RUN yum -y localinstall /tmp/jdk-7u67-linux-x64.rpm

RUN rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera

COPY inst/cdh4.repo /etc/yum.repos.d/cdh4.repo
COPY inst/cloudera-gplextras4.repo /etc/yum.repos.d/cloudera-gplextras4.repo

RUN yum -y install hadoop hadoop-client
RUN yum -y install  hadoop-yarn-resourcemanager hadoop-lzo-cdh4
RUN git clone https://github.com/SkymindIO/hadoop-example-native
RUN cd hadoop-example-native && mvn clean install -DskipTests
RUN mv target/*.tar.gz ~
RUN cd && tar xvf *.tar.gz
RUN mv hadoop-example-1.0-SNAPSHOT/lib/ .
RUN rm /etc/hadoop/conf
RUN mkdir /etc/hadoop/conf
RUN mkdir /data
RUN chmod 777 /data

COPY inst/run.sh /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh" ]
EXPOSE 50060
