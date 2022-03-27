FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
#FROM tensorflow/tensorflow:latest-gpu

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"




RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    libsm6 libxext6 libxrender-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip 
RUN curl -O https://bootstrap.pypa.io/get-pip.py 


#RUN apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
#RUN apt-get install libxvidcore-dev libx264-dev -y
RUN python3 -m pip install -U pip
RUN python3 -m pip install cudnnenv

RUN export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
RUN export CPATH=~/.cudnn/active/cuda/include:$CPATH
RUN export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH
RUN python3 -m pip uninstall -y tensorflow-gpu keras tensorflow

RUN pip3 install pillow
RUN python3 -m pip install Pillow==5.1.0
RUN conda install -c anaconda Pillow==5.1.0

RUN python3 -m pip install -U --force-reinstall tensorflow==2.3

#RUN pip3 install pandas

#CMD ["python3 ","-c","'import tensorflow as tf; tf.test.is_gpu_available()'"]