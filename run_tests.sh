#!/usr/bin/env bash

IMAGE_NAME=ene-docker.iiasa.ac.at/java-python-base

docker build -t ${IMAGE_NAME} .

docker run -it --rm -v ${PWD}:/work -w /work ${IMAGE_NAME} \
  bash -c "pip install .[tests,ci] && py.test tests"