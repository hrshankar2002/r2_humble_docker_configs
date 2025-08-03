## ROS 2 Humble with RViz and Ignition Gazebo (Docker Configs)


### 🔧 Build Docker Image + Containerisation

Containerized and run a development-ready environment with:

- ROS 2 Humble
- RViz2
- Ignition Gazebo Fortress
- Ubuntu 22.04 (optional GPU acceleration)

```bash
# Step 1: Build the image with Docker Buildx 
docker buildx build --load -t ros2_gpu_image .

# Step 2: Run the container with GPU support and GUI forwarding
./run_container_gpu.bash
```


