
# The develop env of ns2.35
This project includes docker develop environment for ns2.35 and already being built source code of ns-2.35

## Base Docker Image

* [ubuntu:10:04](https://registry.hub.docker.com/u/library/ubuntu/)

## Base project

* [docker-ns2](https://github.com/ekiourk/docker-ns2/)


## Usage

### The first time 

Step 1. build ns2 images

```
docker build .
```

Step 2. run ns2 container

```
docker run
```

Step 3. copy ns-2.35 from container to host

```
sudo docker cp ns2:/ns2/ns-2.35/. ./ns-2.35
```

Step 4. start container

```
docker-compose up -d
```

Step 5. close container

```
docker-compose down
```

### After the first time:

Step 1. start container

```
docker-compose up -d
```

Step 2. go inside contianer:
```
docker exec -it ns2 bash
```

Step 3. close container

```
docker-compose down
```

# The useage of ns2

## Simulation Steps

Step 1. cbrgen.tcl is used to generate cbr flows:

```
~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl
```

if in local host ~/ns2/ns-2.35/testfile/:
```
docker exec -it ns2 ns /ns2/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 10 -rate 2.0 > cbr1
```

if inside the container ~/ns2/ns-2.35/indep-utils/cmu-scen-gen/:
```
cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 10 -rate 2.0 > cbr1
```
```
mv cbr1 /ns2/ns-2.35/testfile/
```

Step 2. setdest is used to generate simulation scenario:
```
~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/setdest/setdest
```
    
if in local host ~/ns-2.35/testfile/:
```
docker exec -it ns2 /ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/setdest -n 50 -p 0 -M 20 -t 300 -x 1000 -y 300 > scene1
```

if inside the container ~/ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/:
```
setdest -n 50 -p 0 -M 20 -t 300 -x 1000 -y 300 > scene1
```
```
mv scene1 /ns2/ns-2.35/testfile/
```

Step 3. run a tcl script using ns

inside the container ~/ns2/ns-2.35/testfile/:

```
ns ./aodv.tcl
```

## Simulation virtualization using nam

### mac OS: 
this project is tested on mac OS, before use this project run `xhost + 127.0.0.1` in mac OS.

### unix or linux: 

1. First run container with bash in order to get a prompt inside the container. Make sure you mount the X11 socket and set the DISPLAY environment variable
`docker run -it -v $PWD/ns-simple.tcl:/ns-simple.tcl -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY ekiourk/ns2 bash`

2. After you are inside the container run ns /ns-simple.tcl and NAM should open ready to animate the simulation

If there are problems starting NAM then try to set the argument --cap-add=SYS_ADMIN and run `xhost local:root` on the host


# Python and Jupyter notebook

## Python 

python3.6

pip3.6 

## Jupyter notebook

You can access to jupyter notebook through "http://localhost:8080" with login password: "jupyter"

