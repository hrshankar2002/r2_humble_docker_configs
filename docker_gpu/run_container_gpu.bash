#!/bin/bash
xhost +local:root
mkdir -p /tmp/xdg && chmod 777 /tmp/xdg

docker run -it \
  --gpus all \
  --runtime=nvidia \
  --privileged \
  --env DISPLAY=$DISPLAY \
  --env QT_X11_NO_MITSHM=1 \
  --env XDG_RUNTIME_DIR=/tmp/xdg \
  --env NVIDIA_DRIVER_CAPABILITIES=all \
  --env NVIDIA_VISIBLE_DEVICES=all \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --volume /tmp/xdg:/tmp/xdg \
  --volume /dev/dri:/dev/dri \
  --network host \
  --user root \
  --name ros2_humble_container \
  ros2_humble_img
