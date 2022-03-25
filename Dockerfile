FROM tensorflow/tensorflow:latest-gpu


RUN apt-get update -y
RUN apt install libgl1-mesa-glx -y
RUN apt-get install 'ffmpeg'\
    'libsm6'\
    'libxext6'  -y

RUN apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
RUN apt-get install libxvidcore-dev libx264-dev -y


RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt-get update 
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip 
RUN curl -O https://bootstrap.pypa.io/get-pip.py 
# RUN python3.6 get-pip.py
# RUN rm -rf /var/lib/apt/lists/*



RUN apt-get install -y python3-opencv
RUN apt-get install -y libgl1
RUN pip3 install opencv-python-headless
RUN pip3 install pandas
