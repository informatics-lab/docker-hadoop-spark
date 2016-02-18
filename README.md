# Docker Spark Hadoop

## Build the base image

```
cd hadoop
docker build -t molab/hadoop .
```

## Run hadoop

```
cd hadoop
docker-compose up -d
```

## Build spark

```
cd spark
docker build -t molab/spark-yarn .
```

## Run a spark shell

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-yarn
```
