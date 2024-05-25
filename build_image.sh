#!/usr/bin/env bash
set -eu
if [ -n "${1-}" ]; then
  CACHE='--no-cache'
else
  CACHE=""
fi

# Build the docker image (and tag it)
REPO=ashthespy
IMG_NAME=volbuild
IMG_RELEASE=bullseye
NODE_V=18

echo "Building with ${CACHE}"
# Disable cache and build
docker build --tag ${IMG_NAME}:${IMG_RELEASE} \
  --file docker/Dockerfile \
  --build-arg RELEASE=${IMG_RELEASE} \
  --build-arg NODE_V=${NODE_V} \
  ${CACHE} \
  .

# Extract some container info to ver
docker run ${IMG_NAME}:${IMG_RELEASE} cat /etc/os-release >version

# Set tags from version
docker tag ${IMG_NAME}:${IMG_RELEASE} ${IMG_NAME}:latest
#TODO: Make this more intelligent -
# TAGVER=$(cat version)

TAGVER=$IMG_RELEASE
TAGS=(
  "${TAGVER}"
  # "latest"
)

for TAG in "${TAGS[@]}"; do
  echo Tagging and pushing "${TAG}" to ${REPO}/${IMG_NAME}
  docker tag ${IMG_NAME}:${IMG_RELEASE} ${REPO}/${IMG_NAME}:"${TAG}"
  read -rp "Press [Enter] key to start pushing to hub..."
  docker push ${REPO}/${IMG_NAME}:"${TAG}"
done
