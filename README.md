## ROS2 Humble Docker Configs

Containerized development-ready environment with:

- ROS 2 Humble
- RViz2
- Ignition Gazebo Fortress
- Ubuntu 22.04 (optional GPU acceleration)

```bash
docker buildx build --load -t ros2_gpu_image .
./run_container_gpu.bash
docker start -ai ros2_gpu_container
docker exec -it ros2_gpu_container bash
docker stop ros2_gpu_container
```


