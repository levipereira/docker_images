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



## Deploy yolov7
RUN cd / \
    && git clone https://github.com/WongKinYiu/yolov9.git

WORKDIR /yolov9

