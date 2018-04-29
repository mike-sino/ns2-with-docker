FROM ubuntu:14.04

LABEL maintainer="mike-sino"
LABEL version="1.0"

# Update Ubuntu and Install Dev
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential autoconf automake libxmu-dev libpcap-dev curl gcc-4.4 gcc gdb libc6-dev openjdk-7-jdk&& \
    rm -rf /var/lib/apt/lists/* 

# Install NS2
RUN curl -L -k http://downloads.sourceforge.net/project/nsnam/allinone/ns-allinone-2.35/ns-allinone-2.35.tar.gz | tar xz && \
    mv ns-allinone-2.35 ns2
WORKDIR ns2
RUN chmod 777 /ns2/ns-2.35
ADD patch.diff /ns2/patch.diff
RUN patch -p1 < patch.diff  && \
    ./install
ENV PATH $PATH:/ns2/bin:/ns2/tcl8.5.10/unix:/ns2/tk8.5.10/unix
ENV LD_LIBRARY_PATH /ns2/otcl-1.14:/ns2/lib
ENV TCL_LIBRARY /ns2/tcl8.5.10/library
WORKDIR ns-2.35

# Install Miniconda
RUN curl -LO -k https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b  && \
    rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH $PATH:/miniconda/bin
RUN conda update -y conda  && \
    conda upgrade -y pip && \
    rm -r "/miniconda/pkgs/" && \
    conda clean --all

# Install Jupyter
RUN conda install jupyter  && \
    mkdir /notebook/  && \
    jupyter notebook --generate-config
COPY init/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Install Minimal C kernel for Jupyter
RUN pip install jupyter-c-kernel && \
    install_c_kernel

CMD ["/sbin/init"]