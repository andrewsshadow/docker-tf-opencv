FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04


RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    libsm6 libxext6 libxrender-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip 
RUN curl -O https://bootstrap.pypa.io/get-pip.py 


RUN apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
RUN apt-get install libxvidcore-dev libx264-dev -y
RUN apt-get install -y expect
RUN python3 -m pip install -U pip
RUN python3 -m pip install cudnnenv

RUN python3 -m pip install -U -force-reinstall tensorflow==2.3

RUN apt-get install -y python3-opencv
RUN apt-get install -y libgl1
RUN echo '1/n1' | pip3 install opencv-python-headless 
RUN pip3 install pandas
