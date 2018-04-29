
# The develop env of ns2.35

## Composition

This project includes:
1. docker develop environment for ns
2. already being built source code of ns
3. tools to support ns simulation 
4. ns2 simulation howto document/tips

## Document

All about the project and ns2 simulation howto can be found from [docs](https://ns2-simulation.readthedocs.io)

## Base environment

* It is based on macOS High Sierra version 10.13.4, which may
have issue in other OS

* the docker enviroment is developped based on [docker-ns2](https://github.com/ekiourk/docker-ns2/)

* base docker image is [ubuntu:14:04](https://registry.hub.docker.com/u/library/ubuntu/)

## Tools
In order to take advantages of python, conda is installed along with jupyter notebook.

[miniconda3](https://conda.io/miniconda.html)(python3.6 and pip3.6)

### 1. jupyter notebook

"http://localhost:8080"

You can access to jupyter notebook with login password: "jupyter"

### 2. py-parser
tools written in python to parser ns2 simulation results 


### 3. tcl generation tool

[NSG2.1](https://sites.google.com/site/pengjungwu/nsg) is devlopped in Java to make generation of tcl file easy


## virtualization from docker 
In order to display the windows from docker to macOS that you should confirm X11 is already installed and run `xhost + 127.0.0.1` in mac OS before using nam.

