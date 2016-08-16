## docker-mysql-custom
This set of files relies on the official [Docker MySQL build](https://hub.docker.com/_/mysql/).

I'm adding this here, because this was a bit of work to get going to my satisfaction. 

### File System Structure
I had quite a few dump files so I structured my deploy the following way.
```
~/
[-- /docker-bin/
[---------  /dumps/
[---------  /mysql-docker/
[-----------------------  the files contained in this repo
```
I begin by creating an alpine based container that is purely for storage.  I prefer a container I can zip up and move about.

### Dockerfile for data container
```
FROM alpine:latest
VOLUME /var/lib/mysql
CMD["true"]
```

I then initialize that container, with a name that is easy for me to find in `docker ps -a`
`docker run --name mysql_data -d mysql_data`
### Create the MySQL Container
You can set specific variables in the `env_file`

I then run the script, mysql_docker_run
`~/docker-bin/mysql-docker/mysql_docker_run.sh`

This builds the container that will run SQL dump files located in `dumps`. Ensure that the first command in your .sql file is `CREATE DATABASE yourdbname;`
