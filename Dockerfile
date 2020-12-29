FROM tensorflow/tensorflow:2.0.0-gpu-py3-jupyter

# INSTALL CONDA
RUN apt-get update
RUN apt-get install wget
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda
RUN $HOME/miniconda/bin/conda init
RUN source ~/.bashrc
ENV PATH /root/miniconda/bin:$PATH

# INSTALL VIM
RUN apt-get install -y vim-tiny

# INSTALL CORE LIBRARY
RUN conda update --all
RUN conda create -y -n pytorch3d python=3.6
RUN echo "conda activate pytorch3d" >> ~/.bashrc
RUN conda install --name pytorch3d --yes -c pytorch\
    pytorch \
    torchvision \
    cudatoolkit=10.0
RUN conda install --name pytorch3d --yes -c conda-forge -c fvcore fvcore
RUN conda install --name pytorch3d --yes jupyter
#RUN pip install --upgrade pip && \
RUN /bin/bash -c ". activate pytorch3d && \
    pip install --upgrade pip && \
    pip install \
    scikit-image \
    matplotlib \
    imageio \
    black \
    isort \
    flake8 \
    flake8-bugbear \
    flake8-comprehensions"

RUN conda install --name pytorch3d pytorch3d -c pytorch3d
