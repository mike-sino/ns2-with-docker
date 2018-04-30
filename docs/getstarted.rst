===========
Get started
===========


Quick start
----------------------------------------------

.. tip::
    Project can be started by one command using docker compose

Step 1. start container::

    $ docker-compose up -d


Step 2. go inside contianer::

    $ docker exec -it ns2 bash


Step 3. stop container::

    $ docker-compose down



Rebuild image
----------------------------------------------

.. tip::
    Rebuild image or get pure installed source ns2 code

Step 1. build ns2 images::

    $ docker build .


Step 2. run ns2 container::

    $ docker run

Step 3. copy ns-2.35 from container to host::

    $ sudo docker cp ns2:/ns2/ns-2.35/. ./ns-2.35

Step 4. start container::

    $ docker-compose up -d

Step 5. close container::

    $ docker-compose down


Simulation
----------------------------------------------

.. tip::
    NS simulation can be in local macOS or inside the docker

Step 1. cbrgen.tcl is used to generate cbr flows::

    $ ~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/cbrgen.tcl

if inside the container ~/ns2/ns-2.35/indep-utils/cmu-scen-gen/::

    $ cbrgen.tcl -type cbr -nn 50 -seed 1 -mc 10 -rate 2.0 > cbr1

Step 2. setdest is used to generate simulation scenario::

    $ ~/ns-allinone-2.35/ns-2.35/indep-utils/cmu-scen-gen/setdest/setdest

if in local host ~/ns-2.35/testfile/::

    $ docker exec -it ns2 /ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/
    setdest -n 50 -p 0 -M 20 -t 300 -x 1000 -y 300 > scene1


if inside the container ~/ns2/ns-2.35/indep-utils/cmu-scen-gen/setdest/::

    $ setdest -n 50 -p 0 -M 20 -t 300 -x 1000 -y 300 > scene1
    $ mv scene1 /ns2/ns-2.35/testfile/


Step 3. run a tcl script using ns inside the container
``~/ns2/ns-2.35/testfile/``::

    $ ns ./aodv.tcl

.. tip::
    running ns from local OS is not supported currently
