FROM nvcr.io/nvidia/pytorch:22.12-py3

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    build-essential \
    manpages-dev \
    ca-certificates \
    g++ \
    git \
    libglfw3-dev \
    libgles2-mesa-dev 

    # see https://github.com/FNNDSC/tinycudann-docker-build/blob/master/Dockerfile
ARG TCNN_CUDA_ARCHITECTURES=90;89;86;80;75;70;61;52
ADD . /app

WORKDIR /app

RUN pip3 install --upgrade pip

RUN --mount=type=cache,target=/root/.cache/pip pip3 install -r requirements.txt
