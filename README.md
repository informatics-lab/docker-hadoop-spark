# Docker Spark Hadoop

## Build the base image

```
docker build -t molab/hadoop hadoop
```

## Run hadoop

```
docker-compose -f hadoop/docker-compose.yml up -d
```

## Build spark

```
docker build -t molab/spark-yarn spark
```

## Run a spark shell

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-yarn
```

## Build notebook

```
docker build -t molab/spark-notebook notebook
```

## Run a notebook

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-notebook
```

In the notebook run

```
from pyspark import SparkContext
sc = SparkContext(master="yarn-client")
```

## Build Zeppelin

```
docker build -t molab/zeppelin zeppelin
```

## Run zeppelin

```
docker run --rm -ti -p 8080:8080 -p 8081:8081 --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/zeppelin
```
