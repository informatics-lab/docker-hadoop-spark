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

## Run a spark shell

```
docker run --rm -ti --link=hadoop_yarn_1:yarn --link=hadoop_namenode_1:namenode molab/spark-notebook
```
