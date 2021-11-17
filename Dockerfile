FROM nvcr.io/nvidia/pytorch:21.10-py3
RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-pip \
	python3-setuptools \
	build-essential \
	&& \
	apt-get clean && \
	python -m pip install --upgrade pip

WORKDIR /workspace
COPY ./   /workspace

RUN pip install pip -U
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install -e .

ENV nnUNet_raw_data_base="/workspace/data"
ENV nnUNet_preprocessed="/workspace/data/nnUNet_preprocessed"
ENV RESULTS_FOLDER="/workspace/data/RESULTS_FOLDER"