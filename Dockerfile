FROM ubuntu:18.04


#设置镜像源
#COPY ./sources.list  /etc/apt/sources.list.2

#设置中文
ENV LANG C.UTF-8

WORKDIR /opt
VOLUME /opt

RUN apt-get update \
        && apt-get install -y  vim lrzsz curl net-tools inetutils-ping zip \
        #安装编译工具
        && apt-get install -y repo git-core gitk git-gui gcc-arm-linux-gnueabihf u-boot-tools device-tree-compiler \
        gcc-aarch64-linux-gnu mtools parted libudev-dev libusb-1.0-0-dev python-linaro-image-tools \
        linaro-image-tools gcc-4.8-multilib-arm-linux-gnueabihf gcc-arm-linux-gnueabihf libssl-dev \
        gcc-aarch64-linux-gnu g+conf autoconf autotools-dev libsigsegv2 m4 intltool libdrm-dev curl sed make \
        binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync file bc wget \
        libncurses5 libqt4-dev libglib2.0-dev libgtk2.0-dev libglade2-dev cvs git mercurial rsync openssh-client \
        subversion asciidoc w3m dblatex graphviz python-matplotlib libc6-i386 libssl-dev texinfo \
        liblz4-tool genext2fs lib32stdc++6 liblz4-tool time \
        #设置git配置
        &&git config --global user.email "you@example.com" \
        &&git config --global user.name "Your Name" \
                # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
                && apt-get clean \
                && apt-get autoclean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["/bin/bash"]
