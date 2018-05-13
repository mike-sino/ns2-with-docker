FROM ubuntu:14.04

LABEL maintainer="mike-sino"
LABEL version="1.0"

# Update ubuntu and install dev
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential autoconf automake libxmu-dev libpcap-dev curl gcc-4.4 gcc gdb  \
    libc6-dev openjdk-7-jdk python-tk python-gi python-gi-cairo python3-gi python3-gi-cairo gir1.2-gtk-3.0 python-matplotlib && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /app && \
    mkdir /app/tools && \
    mkdir /app/py-parser


# Install ns2
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

# Install miniconda3
RUN curl -LO -k https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b  && \
    rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH $PATH:/miniconda/bin
RUN conda update -y conda  && \
    conda upgrade -y pip && \
    rm -r "/miniconda/pkgs/" && \
    conda clean --all

# Install jupyter lab and extensions
RUN conda install -c conda-forge jupyterLab && \
    mkdir /notebook/ && \
    conda install -c conda-forge nodejs && \
    jupyter labextension install jupyterlab-drawio && \
    jupyter labextension install @jupyterlab/github

# Install python2 and python3 kernels
RUN conda create -n python2 python=2.7 ipykernel && \
    . activate python2 && \
    python -m ipykernel install --user --name=python2 --display-name=python2 && \
    . deactivate

# Install Minimal C kernel for Jupyter
RUN pip install jupyter-c-kernel && \
    install_c_kernel

CMD ["/sbin/init"]