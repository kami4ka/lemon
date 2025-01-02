FROM --platform=linux/arm64 osrf/ros:jazzy-desktop

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libglvnd0 libgl1 libglx0 libegl1 libgles2 x11-apps \
    python3-pip python3-dev python3-venv python3-full cmake build-essential

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Ensure we use the virtualenv pip and python
SHELL ["/bin/bash", "-c"]
RUN source /opt/venv/bin/activate && \
    pip3 install --no-cache-dir gymnasium torch stable-baselines3 wandb tensorboard