FROM registry.cn-hangzhou.aliyuncs.com/bewithmeallmylife/11.4.0-cudnn8-runtime-ubuntu18.04-conda-python3.8-qt5:1.0.0

USER root
ENV PATH /root/anaconda3/bin:$PATH
RUN  conda create -n alpha-zero-gomoku-api python=3.10 -y
SHELL ["conda", "run", "-n", "bill-customer-risk-detect-api", "/bin/bash", "-c"]
ENV LANGUAGE zh_CN:zh


RUN pip install fastapi==0.114.0 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install uvicorn==0.30.6 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install python-multipart -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install numpy -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com



WORKDIR /app/alpha-zero-gomoku-api

COPY *.py  /app/alpha-zero-gomoku-api

ENV HF_ENDPOINT https://hf-mirror.com
ENV HF_HOME /hugging_face_home

CMD ["/root/anaconda3/envs/alpha-zero-gomoku-api/bin/python","main.py"]


#sudo docker build -t='registry.cn-hangzhou.aliyuncs.com/bewithmeallmylife/alpha-zero-gomoku-api-cuda-11.4.0:1.0.0' .

#sudo docker run   --ipc=host  --privileged  -p 5112:5112 -it -d  registry.cn-hangzhou.aliyuncs.com/bewithmeallmylife/alpha-zero-gomoku-api-cuda-11.4.0:1.0.0
