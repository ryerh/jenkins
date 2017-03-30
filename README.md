# jenkins
Jenkins container which can execute docker command on it's host through the docker.sock

## Feature

1. Run Jenkins inside Docker container
2. Provide docker cli command inside Jenkins container
3. Link `/var/run/docker.sock` from host to Jenkins container

## How to use

1. Build the Jenkins image for later use

``` bash
$ sudo ./build-simple.sh
```

2. Start Jenkins container

``` bash
$ sudo ./start-simple.sh
```

3. Open [http://localhost:8080](http://localhost:8080) to finish jenkins installation.
