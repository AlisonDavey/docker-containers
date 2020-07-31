#!/bin/bash
# Build Images Manually For Testing

export IMAGE_NAME="fastdotai/fastai2"
export IMAGE_NAME_DEV="fastdotai/fastai2-dev"
export VERSION="0.0.22"
export DOCKER_BUILDKIT=1

# build production image
docker build --cache-from ${IMAGE_NAME}:latest -t ${IMAGE_NAME}:latest --build-arg BUILDKIT_INLINE_CACHE=1 -f docker/Dockerfile .
docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:${VERSION}

#build dev image
docker build -t ${IMAGE_NAME_DEV}:latest --build-arg BUILD=dev -f docker/Dockerfile .
docker tag ${IMAGE_NAME_DEV}:latest ${IMAGE_NAME_DEV}:${VERSION}

# push all the images
docker push ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}:${VERSION}

docker push ${IMAGE_NAME_DEV}:latest
docker push ${IMAGE_NAME_DEV}:${VERSION}
