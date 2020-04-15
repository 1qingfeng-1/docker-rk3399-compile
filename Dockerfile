FROM ubuntu:16.04


#设置镜像源
#COPY ./sources.list  /etc/apt/sources.list.2

#设置中文
ENV LANG C.UTF-8

WORKDIR /opt
VOLUME /opt

RUN apt-get update \
        && apt-get install -y  vim lrzsz curl net-tools inetutils-ping zip \
        #安装编译工具
        && apt-get install -y git-core gitk git-gui gcc-arm-linux-gnueabihf u-boot-tools \
        device-tree-compiler gcc-aarch64-linux-gnu mtools parted libudev-dev \
        libusb-1.0-0-dev gcc-4.8-multilib-arm-linux-gnueabihf gcc-arm-linux-gnueabihf \
        libssl-dev gcc-aarch64-linux-gnu repo build-essential\
        #设置git配置
        &&git config --global user.email "you@example.com" \
        &&git config --global user.name "Your Name" \
                # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
                && apt-get clean \
                && apt-get autoclean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["/bin/bash"]
