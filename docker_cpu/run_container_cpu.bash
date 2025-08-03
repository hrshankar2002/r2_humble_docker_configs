#!/bin/bash

xhost +local:docker

docker run -it --rm \
    --name ros2_no_gpu \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    ros2-humble-nogpu
