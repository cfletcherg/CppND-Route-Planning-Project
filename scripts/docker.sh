#!/bin/bash

IMAGE_NAME="cppnd_route_planning:latest"
CONTAINER_NAME="cppnd_route_planning_container"

build() {
    docker build -t $IMAGE_NAME -f docker/Dockerfile .
}

run() {
    xhost +local:root
    docker run --rm -it \
        -v "$(pwd)":/workspace \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --name $CONTAINER_NAME \
        $IMAGE_NAME
}

attach() {
    docker exec -it $CONTAINER_NAME /bin/bash
}

case "$1" in
    build)
        build
        ;;
    run)
        run
        ;;
    attach)
        attach
        ;;
    *)
        echo "Usage: $0 {build|run|attach}"
        exit 1
        ;;
esac
