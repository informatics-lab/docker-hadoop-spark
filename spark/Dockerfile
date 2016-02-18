FROM molab/hadoop

RUN apt-get update && apt-get install -y curl && \
    curl -s http://apache.mirror.anlx.net/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz | tar -xz -C /usr/local/ && \
    apt-get remove -y curl
RUN cd /usr/local && ln -s spark-1.6.0-bin-hadoop2.6 spark
ENV SPARK_HOME /usr/local/spark

ENV YARN_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin

RUN echo spark.yarn.jar hdfs:///spark/spark-assembly-1.6.0-hadoop2.6.0.jar > $SPARK_HOME/conf/spark-defaults.conf

ADD bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

ENTRYPOINT [ "/bootstrap.sh" ]
