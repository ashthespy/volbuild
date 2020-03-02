#!/usr/bin/env bash
set -eux

# Build the docker image and run it!
docker build -t volumio-build:buster -f Dockerfile .

docker run \
	--rm -it \
	--privileged --tty \
	-v  `pwd`/Build:/Build \
	volumio-build \
	bash
	#./build.sh -b armv7
#./build.sh -d orangepilite -b armv7 -v 3.565
