FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update -y
RUN apt install libgl1-mesa-glx -y
RUN apt-get install 'ffmpeg'\
    'libsm6'\
    'libxext6'  -y

RUN echo "**** Installing Python ****" && \
    add-apt-repository ppa:deadsnakes/ppa &&  \
    apt-get install -y build-essential python3.6.9 python3.6.9-dev python3-pip && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3.6.9 get-pip.py && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install -y python3-opencv
RUN apt-get install -y libgl1
RUN pip3.6.9 install opencv-python-headless
RUN pip3.6.9 install pandas
