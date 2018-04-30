
# The develop env of ns2.35

## Composition

This project includes:
*  Docker develop environment
*  Already being installed source code of ns2.35
*  New protocals and simulation analyze files
*  Auxiliary tools supporting ns simulation
*  Howto simulation and project description in [document](https://ns2-simulation.readthedocs.io)

## Base environment

* Local OS: macOS High Sierra version 10.13.4 (may
have issue in other OS)
* Docker base image is [ubuntu:14:04](https://registry.hub.docker.com/u/library/ubuntu/)
* Docker files are based on [docker-ns2](https://github.com/ekiourk/docker-ns2/)
* [Miniconda3](https://conda.io/miniconda.html)(python3.6 and pip3.6) is installed along with jupyter notebook.

## Tools

* ### jupyter notebook
Access to http://localhost:8080 with login password: "jupyter"
* ### py-parser
Files written in python to parser ns2 simulation results
* ### tcl generation tool
[NSG2.1](https://sites.google.com/site/pengjungwu/nsg) is devlopped in Java to make generation of tcl file easy

## Virtualization
In order to display the windows (nam or NSG) from docker to macOS that you should:
1. Confirm X11 is already installed 
2. Run `xhost + 127.0.0.1` in mac OS in advance.

