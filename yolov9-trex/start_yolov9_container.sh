image_name="local/nvidia_yolov9:yolov9-trex"

docker run --gpus all  \
 -it \
 --net host  \
 --ipc=host \
 -v /dataset/coco_2017/dataset/coco/:/yolov9/coco \
 -v $(pwd)/experiments:/yolov9/experiments \
 -v $(pwd)/runs:/yolov9/runs \
 $image_name



