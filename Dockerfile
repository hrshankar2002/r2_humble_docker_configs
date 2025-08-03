FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

# Set locale
RUN apt update && apt install -y locales && \
    locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    apt clean

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install ROS GUI, RViz, ros_gz bridge
RUN apt update && apt install -y \
    ros-humble-desktop \
    ros-humble-ros-gz \
    python3-colcon-common-extensions \
    python3-pip \
    mesa-utils libruby3.0 libpcre3 ruby && \
    apt clean

# Add Fortress repository
RUN apt update && apt install -y gnupg lsb-release wget && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | \
      tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt update && apt install -y ignition-fortress && \
    apt clean

# Source ROS on login
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

CMD ["bash"]
