#!/bin/bash

docker run --rm -it --runtime=nvidia -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v build:/director/build director
