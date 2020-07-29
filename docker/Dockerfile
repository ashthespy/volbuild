# Volumio OS building environment

ARG RELEASE=buster

FROM debian:$RELEASE

# Install requirements for build script
RUN apt-get -q update && apt-get install -qq -y\
		binfmt-support \
		build-essential \
		ca-certificates \
		curl \
		debootstrap \
		dosfstools \
		git \
		kpartx \
		libssl-dev \
		lz4 \
		lzop \
		md5deep \
		multistrap \
		parted \
		patch \
		pv \
		qemu \
		qemu-user-static\
		qemu-utils \
		samba \
		squashfs-tools \
		sudo \
		u-boot-tools \
		xz-utils \
		zip \
		&& \
		rm -rf /var/lib/apt/lists/* && \
    mkdir /Build && \
    mkdir /Images

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs

VOLUME ["/Build","/Images"]


WORKDIR /Build
