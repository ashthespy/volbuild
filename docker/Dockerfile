# Volumio OS building environment


ARG RELEASE=jessie

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
		dosfstools \
		qemu \
		binfmt-support \
		qemu-utils \
    lzop \
    sudo \
		xz-utils && \
		rm -rf /var/lib/apt/lists/* && \
    mkdir /Build && \
    mkdir /Images

#RUN apt-get install -qq -y shellcheck
RUN wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-v0.6.0.linux.x86_64.tar.xz" | tar -xJv && \
    cp shellcheck-v0.6.0/shellcheck /usr/bin/ && shellcheck -V


VOLUME ["/Build","/Images"]


WORKDIR /Build
