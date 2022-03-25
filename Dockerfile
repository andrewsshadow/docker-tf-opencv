FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN apt-get install -y python3-opencv
RUN apt-get install -y libgl1-mesa-glx
RUN pip3 install opencv-python-headless
RUN pip3 install pandas
