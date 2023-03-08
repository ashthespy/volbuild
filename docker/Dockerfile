# Volumio OS building environment

ARG RELEASE=buster

FROM debian:$RELEASE

ARG NODE_V=14
# Install requirements for build script
RUN apt-get -q update \
	&& apt-get -qq -y install \
	apt-transport-https \
	binfmt-support\
	build-essential\
	ca-certificates\
	curl\
	debootstrap\
	dosfstools\
	git\
	jq\
	kmod\
	kpartx\
	libssl-dev\
	lz4\
	lzop\
	md5deep\
	multistrap\
	parted\
	patch\
	pigz\
	pv\
	qemu-user-static\
	qemu-utils\
	qemu\
	squashfs-tools\
	sudo\
	u-boot-tools\
	xz-utils\
	zip\
	&& \
	rm -rf /var/lib/apt/lists/* && \
	mkdir /Build && \
	mkdir /Images

RUN curl -sL https://deb.nodesource.com/setup_$NODE_V.x | bash - && apt-get install -y nodejs
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&\
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" >> /etc/apt/sources.list &&\
	apt-get update &&\
	apt-get -y install docker-ce-cli &&\
	groupadd docker &&\
	useradd volumiobuild && usermod -aG docker volumiobuild

VOLUME ["/Build","/Images"]


WORKDIR /Build
