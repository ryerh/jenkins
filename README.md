# jenkins
Jenkins container which can execute docker command on it's host through the docker.sock

## How to use

1. Build the `jenkins-docker` image for later use

``` bash
$ sudo ./build.sh
```

2. Start `jenkins-docker` container

``` bash
$ sudo docker run --rm \
    -p 8080:8080 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name jenkins-docker \
    jenkins-docker
```

3. Open [http://localhost:8080](http://localhost:8080) to finish jenkins installation.
