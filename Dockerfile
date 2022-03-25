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

RUN pip3 install pillow
RUN python3 -m pip install pillow
RUN python3 -m3 pip install pillow

RUN python3 -m pip install -U -force-reinstall tensorflow==2.3

#UN pip3 install pandas
