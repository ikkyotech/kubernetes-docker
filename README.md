kubernetes-docker
=================

Kubernetes running within docker

# Running the server

```
$ cd master/
$ docker build . -name "kubernetes"
$ docker run --privileged -ti --net="host" --name="kubernetes" -v /var/lib/docker:/var/lib/docker -v /var/log/:/log kubernetes
```

# Query the api with kubecfg

```
$ cd kube/
$ docker build . -name "kube"
$ alias kube="docker run -ti --net='host' --privileged kube"
$ kube --help
$ kube list /pods
```
