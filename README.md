kubernetes-docker
=================

Kubernetes running within docker

# Running the server

1. from registry
   ```
   $ alias start_master="docker rm -f kubernetes; docker run --privileged -d --net='host' --name='kubernetes' -v /var/lib/docker:/var/lib/docker -v /var/run/docker.sock:/var/run/docker.sock -v /var/log/kubernetes:/tmp fandekasp/kubernetes-docker"
   ```

2. build locally
   ```
   $ cd master/
   $ docker build -t "kubernetes" .
   $ alias start_master="docker rm -f kubernetes; docker run --privileged -ti --net='host' --name='kubernetes' -v /var/lib/docker:/var/lib/docker -v /var/run/docker.sock:/var/run/docker.sock -v /var/log/kubernetes:/tmp kubernetes"
   ```

3. start kubernetes
   ```
   $ start_master
   $ multitail --mergeall -iw "/var/log/kubernetes/*.log" 2
   ```

# Query the api with kubecfg

Set the directory where all your configuration files (json,yaml) are located.
The path must be absolute. Eg:
```
$ CFG_DIR="$(pwd)/cfg/"
```

1. from registry
   ```
   $ alias kube="docker run -ti --net='host' --privileged -v $CFG_DIR:/cfg fandekasp/kube"
   ```

2. build locally
   ```
   $ cd kube/
   $ docker build -t "kube" .
   $ alias kube="docker run -ti --net='host' --privileged -v $CFG_DIR:/cfg kube"
   ```

3. start kubecfg
   ```
   $ kube --help
   $ kube list /pods
   $ kube -c /cfg/yourfile.json create pods
   ```

   **Note:** When specifying a config file with -c, keep in mind that those
   config files are in `/cfg/` in the kube container.
