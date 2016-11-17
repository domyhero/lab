#!/bin/bash

set -ex

WORKDIR=`pwd`
REDIS_VER=3.2.5
REDIS_URL=http://download.redis.io/releases/redis-${REDIS_VER}.tar.gz

# 存放redis的可执行文件
mkdir -p bin
# 下载源码
wget $REDIS_URL
# 解压源码&编译
tar fxz redis-${REDIS_VER}.tar.gz && cd redis-${REDIS_VER} && make 
# 复制可执行文件到bin目录
cd src && cp redis-benchmark redis-check-aof redis-check-rdb redis-cli redis-sentinel redis-server redis-trib.rb ../../bin
# 删除源码
cd $WORKDIR && rm -rf redis-${REDIS_VER}.tar.gz redis-${REDIS_VER}
