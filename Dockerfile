FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update -y
RUN pip3 install opencv-python
RUN pip3 install pandas