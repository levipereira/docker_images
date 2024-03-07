# Use the base image
FROM nvcr.io/nvidia/deepstream:6.4-triton-multiarch

# Set the working directory
WORKDIR /opt/nvidia/deepstream/deepstream

# Run scripts
# RUN ./user_additional_install.sh
# RUN ./update_rtpmanager.sh

# Remove the outdated deepstream_python_apps
RUN rm -rf /opt/nvidia/deepstream/deepstream/sources/deepstream_python_apps

RUN ./user_deepstream_python_apps_install.sh --version 1.1.10

# Copy the files from the host to the Docker image

# Install the Lib nvdsinfer_yolov9_efficient_nms for Gst-nvinferserver
RUN  cd /tmp && git clone https://github.com/levipereira/nvdsinfer_yolo_efficient_nms.git \
     && cp -R /tmp/nvdsinfer_yolo_efficient_nms/ /opt/nvidia/deepstream/deepstream/sources/libs/ \
     && rm -rf /tmp/nvdsinfer_yolo_efficient_nms/

RUN cd /opt/nvidia/deepstream/deepstream/sources/libs/nvdsinfer_yolo_efficient_nms \
    && CUDA_VER=12.2 make -f MakeFile all \
    && CUDA_VER=12.2 make -f MakeFile install

## Copy Application to Docker

RUN mkdir -p /deepstream_python_apps/apps/

RUN  cd /deepstream_python_apps/apps/ \
    && git clone https://github.com/levipereira/deepstream-yolo-triton-server-rtsp-out.git

WORKDIR /deepstream_python_apps/apps/deepstream-yolo-triton-server-rtsp-out/ds-6.4-ts-yolo-rtsp-out/


# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
