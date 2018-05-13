
# The develop env of ns2.35

[![](https://images.microbadger.com/badges/image/mikesino/ns2.35-with-docker.svg)](https://microbadger.com/images/mikesino/ns2.35-with-docker "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mikesino/ns2.35-with-docker.svg)](https://microbadger.com/images/mikesino/ns2.35-with-docker "Get your own version badge on microbadger.com")

## Base environment
* Host OS: macOS High Sierra version 10.13.4 (may
have issue in other OS)
* Docker base image is [ubuntu:14:04](https://registry.hub.docker.com/u/library/ubuntu/)
* Docker files are based on [docker-ns2](https://github.com/ekiourk/docker-ns2/)
*  Docker develop environment [ns2.35-with-docker](https://hub.docker.com/r/mikesino/ns2.35-with-docker/) can be found in docker hub
* [Miniconda3](https://conda.io/miniconda.html) ( python3.6 and pip3.6 ) is installed along with jupyter notebook.

## Composition
This project includes:

*  Howto simulation and project description in [docs](https://ns2-simulation.readthedocs.io)
*  Already being installed source code of [ns2.35](https://www.isi.edu/nsnam/ns/)
*  New protocals including mflood, blackhole-aodv, grayhole-aodv, watchdog(aodv), and Bayesian-watchdog(aodv) 
*  Simulation analyze tools: NSG2.1, APP-tool, py-parser, jupyter notebook

## Tools
* ### tcl generation tool
[NSG2.1](https://sites.google.com/site/pengjungwu/nsg) is devlopped in Java to make generation of tcl file easy with GUI

![NSG2.1](https://github.com/mike-sino/ns2.35-with-docker/blob/master/images/NSG2.1.png)

* ### trace file parser
[APP Tool](https://github.com/WiNG-NITK/APP-Tool) (Automated Post Processing tool) is a ns2 tracefile analyser with GUI

![APP Tool](https://github.com/mike-sino/ns2.35-with-docker/blob/master/images/APP%20Tools.png)

* ### nam: network animator
[Nam](https://www.isi.edu/nsnam/nam/) is a Tcl/TK based animation tool for viewing network simulation traces and real world packet traces.

![Nam](https://github.com/mike-sino/ns2.35-with-docker/blob/master/images/NAM.png)

* ### python tools
[ns2 tools](http://www.evanjones.ca/software/ns2tools.html) for simulation preparation and results parser

* ### jupyter notebook
Access to http://localhost:8080 with login password: "jupyter"

## Virtualization
In order to display the GUI (nam / NSG / APP Tool) from docker to macOS that you should:
1. Confirm X11 is already installed 
2. Run `xhost + 127.0.0.1` in host mac OS in advance.

