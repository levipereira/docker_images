tag_name="deepstream_6.4-triton-server-yolo"
image_name="local/nvidia:${tag_name}"
docker build --no-cache -t $image_name -f  Dockerfile  .
