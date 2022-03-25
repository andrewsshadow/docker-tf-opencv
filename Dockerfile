FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install opencv-python
RUN pip3 install pandas
