# Use the official NVIDIA PyTorch image as the base image
FROM nvcr.io/nvidia/pytorch:23.02-py3

# Update and install required dependencies
RUN apt-get update \
    && apt-get install -y zip htop screen libgl1-mesa-glx vim libfreetype6-dev  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install necessary Python packages
RUN pip install --upgrade pip \
    && pip install seaborn \
                   thop \
                   wandb \
                   markdown-it-py==2.2.0 \
                   onnx-simplifier==0.4.35 \
                   onnxsim==0.4.35 \
                   onnxruntime==1.16.3 \
                   ujson==5.9.0 \
                   pycocotools==2.0.7 \
                   virtualenv \
                   widgetsnbextension==4.0.9 \
    && pip install --no-cache-dir --force-reinstall pillow==9.5.0


RUN mkdir -p /opt/nvidia_trex

# Create and activate a virtual environment Clone TensorRT repository and install trt-engine-explorer (trex)
RUN cd /opt/nvidia_trex/ \
    && python3 -m virtualenv env_trex \
    && /bin/bash -c "source env_trex/bin/activate && pip install Werkzeug==2.2.2 graphviz==0.20.1" \
    && cd /opt/nvidia_trex/ \
    && git clone https://github.com/NVIDIA/TensorRT.git \
    && cd TensorRT \
    && git checkout release/8.6 \
    && cd tools/experimental/trt-engine-explorer \
    && /bin/bash -c "source /opt/nvidia_trex/env_trex/bin/activate && pip install -e ." \
    && /bin/bash -c "source /opt/nvidia_trex/env_trex/bin/activate && jupyter nbextension enable widgetsnbextension --user --py"


## Deploy yolov7
RUN cd / \
    && git clone https://github.com/WongKinYiu/yolov9.git

WORKDIR /yolov9

