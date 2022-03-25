FROM python:3.6


RUN apt-get update -y
RUN apt install libgl1-mesa-glx -y
RUN apt-get install 'ffmpeg'\
    'libsm6'\
    'libxext6'  -y

RUN apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
RUN apt-get install libxvidcore-dev libx264-dev -y
RUN python3 -m pip install -U pip
RUN python3 -m pip install cudnnenv

RUN /usr/.local/bin/cudnnenv install v7.6.5-cuda10
RUN /usr/.local/bin/cudnnenv activate v7.6.5-cuda10

RUN export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
RUN export CPATH=~/.cudnn/active/cuda/include:$CPATH
RUN export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH

RUN python3 -m pip uninstall -y tensorflow-gpu keras tensorflow
RUN python3 -m pip install -U -force-reinstall tensorflow==2.3

RUN apt-get install -y python3-opencv
RUN apt-get install -y libgl1
RUN pip3 install opencv-python-headless
RUN pip3 install pandas
