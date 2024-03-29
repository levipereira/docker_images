# Building Docker Image for NVIDIA PyTorch Environment with TensorRT and YOLOv7

This Repo sets up an environment for running NVIDIA PyTorch applications, focusing on training YOLOv9 models.<br>
It also installs the [TensorRT Engine Explorer (TREx)](https://developer.nvidia.com/blog/exploring-tensorrt-engines-with-trex/), which is a Python library and a set of Jupyter notebooks for exploring a TensorRT engine plan and its associated inference profiling data.

* Note: This image already supports NVIDIA Ada devices with a compute capability of 8.9 (e.g., RTX 4090). Ensure you have the latest NVIDIA Driver installed for optimal performance.

## Driver Requirements
NVIDIA PyTorch image (`nvcr.io/nvidia/pytorch:23.02-py3`)

[Release 23.02](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-23-02.html) is based on CUDA 12.0.1, which requires NVIDIA Driver release 525 or later. However, if you are running on a data center GPU (for example, T4 or any other data center GPU), you can use NVIDIA driver release 450.51 (or later R450), 470.57 (or later R470), 510.47 (or later R510), 515.65 (or later R515), or 525.85 (or later R525). The CUDA driver's compatibility package only supports particular drivers. Thus, users should upgrade from all R418, R440, R460, and R520 drivers, which are not forward-compatible with CUDA 12.0.

## GPU Requirements
NVIDIA PyTorch image (`nvcr.io/nvidia/pytorch:23.02-py3`)

[Release 23.02](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-23-02.html)  supports CUDA compute capability 6.0 and later. This corresponds to GPUs in the NVIDIA Pascal, NVIDIA Volta™, NVIDIA Turing™, NVIDIA Ampere architecture, and NVIDIA Hopper™ architecture families.

## Dockerfile Flow

1. **Base Image**: The Dockerfile uses the official NVIDIA PyTorch image (`nvcr.io/nvidia/pytorch:23.02-py3`) as the base image.

2. **Update and Install Dependencies**: It updates the package lists and installs required dependencies such as `zip`, `htop`, `screen`, `libgl1-mesa-glx`, `libfreetype6-dev `

3. **Upgrade pip and Install Python Packages**: Upgrades pip to the latest version and installs necessary Python packages using `pip`. Packages include `seaborn`, `thop`, `markdown-it-py`, `onnx-simplifier`, `onnxsim`, `onnxruntime`, `pycuda`, `ujson`, `pycocotools`, `virtualenv`, and `widgetsnbextension`.

4. **Create and Activate Virtual Environment**: Creates a virtual environment named `env_trex` in `/opt/nvidia_trex/` and activates it. Installs additional packages `Werkzeug` and `graphviz`.

5. **Clone and Install trt-engine-explorer**: Clones the TensorRT repository, checks out the release/8.6 branch, and installs `trt-engine-explorer` in the virtual environment.

6. **Install YOLOv9**: Clones the YOLOv9 repository from [WongKinYiu/yolov9](https://github.com/WongKinYiu/yolov9.git) to the root directory (`/`). 
## Usage

Build the Docker image with custom name:

```bash
docker build --no-cache -t your_image_name -f  Dockerfile  .
```
or  Build the Docker image with default name "local/nvidia_yolov7:yolov7_qat"

```bash
sh ./build_yolov9_image.sh
```

## Usage (Starting Docker Container)

**Instructions for Starting the Image**:

   ```bash
   image_name="local/yolov9:yolov9"

   docker run --gpus all  \
   -it \
   --net host  \
   --ipc=host \
   -v $(pwd)/coco:/yolov9/coco \
   -v $(pwd)/runs:/yolov9/runs \
   $image_name
```


## Experiments Directories

- **Default YOLO Project Directory**: `/yolov7/runs`

## Dataset Mappings
- `$(pwd)/coco:/yolov7/coco`: Location of the COCO dataset (must be `/yolov7/coco`).

or
- `$(pwd)/dataset:/yolov7/dataset`: Location of the custom dataset (you can configure any location).



##
Also you  can edit and start using script.

``` bash
sh ./start_yolo_container.sh
```

