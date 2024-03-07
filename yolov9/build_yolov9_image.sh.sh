tag_name="yolov9-trex"
image_name="local/nvidia_yolov9:${tag_name}"
docker build --no-cache -t $image_name -f  Dockerfile  .