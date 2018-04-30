=====
About
=====

.. tip::

    This project is develop in macOS High Sierra 10.13.4, which may have issue in other operation system.


Project composition
----------------------------------------------

1. docker develop environment for ns2.35

2. already being built source code of ns-2.35


Base docker image
----------------------------------------------


`ubuntu:14:04 <https://registry.hub.docker.com/u/library/ubuntu/>`_


Python and jupyter notebook
----------------------------------------------


You can access to jupyter notebook through http://localhost:8080 with login password: "jupyter"


Virtualization
----------------------------------------------

**1. mac OS:**

    run ``xhost + 127.0.0.1`` in mac OS before using nam

**2. unix or linux:**

1. First run container with bash in order to get a prompt inside the container.

* Make sure that you mounted the X11 socket
* Make sure that DISPLAY environment variable is already set::

    $ docker run -it -v $PWD/ns-simple.tcl:/ns-simple.tcl -v
    /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY ekiourk/ns2 bash


2. After you are inside the container run ``ns /ns-simple.tcl``
and NAM should open ready to animate the simulation

3. If there are problems starting NAM then try to set the
argument ``--cap-add=SYS_ADMIN`` and run ``xhost local:root`` on the host

