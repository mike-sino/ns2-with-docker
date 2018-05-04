
# The develop env of ns2.35
[![](https://images.microbadger.com/badges/image/mikesino/ns2.35-with-docker.svg)](https://microbadger.com/images/mikesino/ns2.35-with-docker "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mikesino/ns2.35-with-docker.svg)](https://microbadger.com/images/mikesino/ns2.35-with-docker "Get your own version badge on microbadger.com")

## Composition

This project includes:
*  Docker develop environment [ns2.35-with-docker](https://hub.docker.com/r/mikesino/ns2.35-with-docker/)
*  Already being installed source code of [ns2.35](https://www.isi.edu/nsnam/ns/)
*  New protocals including mflood, blackhole-aodv, grayhole-aodv, watchdog(aodv), and Bayesian-watchdog(aodv) 
*  Simulation analyze tools: jupyter, py-parser, NSG2.1, APP-tool
*  Howto simulation and project description in [docs](https://ns2-simulation.readthedocs.io)

## Base environment

* Local OS: macOS High Sierra version 10.13.4 (may
have issue in other OS)
* Docker base image is [ubuntu:14:04](https://registry.hub.docker.com/u/library/ubuntu/)
* Docker files are based on [docker-ns2](https://github.com/ekiourk/docker-ns2/)
* [Miniconda3](https://conda.io/miniconda.html)(python3.6 and pip3.6) is installed along with jupyter notebook.

## Tools
* ### jupyter notebook
Access to http://localhost:8080 with login password: "jupyter"
* ### python tools
Tools for ns2 simulation written in python
* ### trace file parser
A ns-2 trace file analyser written in python with GUI named [APP-tool](https://github.com/WiNG-NITK/APP-Tool)
* ### tcl generation tool
[NSG2.1](https://sites.google.com/site/pengjungwu/nsg) is devlopped in Java to make generation of tcl file easy

## Virtualization
In order to display the windows (nam or NSG) from docker to macOS that you should:
1. Confirm X11 is already installed 
2. Run `xhost + 127.0.0.1` in mac OS in advance.

