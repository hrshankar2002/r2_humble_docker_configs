# Use official ROS 2 Humble base image
FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and GUI tools
RUN apt update && apt install -y \
    lsb-release gnupg2 curl wget git nano \
    mesa-utils libgl1-mesa-glx libx11-6 \
    libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 \
    libxrandr2 libxrender1 libxtst6 libsm6 libice6 libfontconfig1 libdbus-1-3 \
    libgtk-3-0 \
    x11-apps sudo \
    && rm -rf /var/lib/apt/lists/*

# Setup user
ARG USERNAME=ros
RUN useradd -m -s /bin/bash $USERNAME && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

# Source ROS 2 setup and install Gazebo Ignition Fortress
RUN sudo apt update && sudo apt install -y \
    ros-humble-desktop \
    ignition-fortress \
    && sudo rm -rf /var/lib/apt/lists/*

# Set environment
ENV SHELL=/bin/bash
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

CMD ["bash"]
