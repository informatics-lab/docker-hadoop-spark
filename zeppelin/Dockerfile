FROM molab/spark-yarn
#MAINTAINER Chris Hawkins <chris.hawkins@accenture.com>
MAINTAINER Jacob Tomlinson <jacob.tomlinson@informaticslab.co.uk>

# Updates & Install Prerequisites
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget curl npm git
WORKDIR /tmp/

ENV ZEPPELIN_HOME /usr/local/zeppelin
RUN mkdir -p $ZEPPELIN_HOME

# Maven 3.1 Install
RUN wget http://download.nextag.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && \
    tar -xzvf apache-maven-3.3.3-bin.tar.gz -C /usr/local && \
    ln -s /usr/local/apache-maven-3.3.3 /usr/local/apache-maven && \
    ln -s /usr/local/apache-maven/bin/mvn /usr/local/bin/mvn && \
    echo “export M2_HOME=/usr/local/apache-maven” >> /etc/profile.d/apache-maven.sh

RUN git clone --branch branch-0.5.6 https://github.com/apache/incubator-zeppelin.git $ZEPPELIN_HOME

WORKDIR $ZEPPELIN_HOME
RUN mvn clean package -Pspark-1.6 -Phadoop-2.6 -Pyarn -Ppyspark -DskipTests

EXPOSE 8080 8081

ADD zeppelin-env.sh $ZEPPELIN_HOME/conf/zeppelin-env.sh
ADD zeppelin-site.xml $ZEPPELIN_HOME/conf/zeppelin-site.xml
ADD startup.sh $ZEPPELIN_HOME/startup.sh
RUN chmod +x $ZEPPELIN_HOME/startup.sh

ENTRYPOINT $ZEPPELIN_HOME/startup.sh
