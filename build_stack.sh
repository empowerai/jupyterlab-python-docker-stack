#!/bin/bash
cd base/
docker build \
  --build-arg BASE_IMAGE=ubuntu \
  --build-arg BASE_IMAGE_TAG=22.04 \
  --build-arg BUILD_ON_IMAGE=glcr.b-data.ch/cuda/python/ver \
  --build-arg PYTHON_VERSION=3.11.2 \
  --build-arg CUDA_IMAGE_FLAVOR=devel \
  -t jupyterlab/cuda/python/base \
  -f latest.Dockerfile .
cd ../
echo $PWD
cd scipy/
docker build \
  --build-arg BUILD_ON_IMAGE=jupyterlab/cuda/python/base \
  --build-arg PYTHON_VERSION=latest \
  -t jupyterlab/cuda/python/scipy \
  -f latest.Dockerfile .
cd ../
echo $PWD
cd empower/
docker build \
    -t ncicto/gpu-jupyter-noconda-py311 \
    -f Dockerfile .
cd ../

docker push ncicto/gpu-jupyter-noconda-py311:latest
