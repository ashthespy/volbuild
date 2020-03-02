# Volumio OS building environment

ARG RELEASE=buster

FROM debian:$RELEASE

# Install requirements for build script
RUN apt-get -q update && apt-get install -qq -y\
		git \
		patch \
		squashfs-tools \
		kpartx \
		multistrap \
		qemu-user-static\
		samba \
		debootstrap \
		parted \
		qemu \
		binfmt-support \
		qemu-utils \
		lzop \
		sudo \
		dosfstools \
		xz-utils \
		curl \
		ca-certificates \
		pv \
		lz4 \
		md5deep \
		u-boot-tools \
		&& \
		rm -rf /var/lib/apt/lists/* && \
    mkdir /Build && \
    mkdir /Images

# RUN apt-get install -qq -y shellcheck
# RUN wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-v0.6.0.linux.x86_64.tar.xz" | tar -xJv && \
#     cp shellcheck-v0.6.0/shellcheck /usr/bin/ && shellcheck -V

# RUN echo "deb http://deb.debian.org/debian jessie main">/etc/apt/sources.list.d/jessie.list && \
#  		apt-get -q update && apt-get -qq -y install dosfstools=3.0.27-1

VOLUME ["/Build","/Images"]


WORKDIR /Build
