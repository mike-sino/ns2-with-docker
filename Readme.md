
# The develop env of ns2

## The fist time

### 1. build ns2 images

```
docker build .
```

### 2. run ns2 container

```
docker run
```


### 3. copy ns-2.35 from docker to local

```
sudo docker cp ns2:/ns2/ns-2.35/. ./ns-2.35
```

### 4. start container

```
docker-compose up -d
```

### 5. close container

```
docker-compose down
```

## simulation tools

1. cbrgen.tcl:

```
~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl
```

for example, in local host ns-2.35/aodv/testfile/:

```
docker exec -it ns2 ns /ns2/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 10 -rate 2.0 > cbr1
```

2. setdest:

```
~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/setdest/
```

for example, in local host ns-2.35/aodv/testfile/:

```
docker exec -it ns2 /ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/setdest -n 50 -p 0 -M 20 -t 300 -x 1000 -y 300 > scene1
```


3. test file of AODV

```
~/ns-allinone-2.35/ ns-2.35/aodv/testfile/
```

for example, in local host ns-2.35/aodv/testfile/:

```
docker exec -it ns2 ns /ns2/ns-2.35/aodv/testfile/aodv.tcl
```