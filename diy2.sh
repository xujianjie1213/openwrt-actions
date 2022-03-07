#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#### Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#### add ext luci-app
git clone https://github.com/kenzok8/small-package package/small-package
git clone https://github.com/kenzok8/small package/small
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
### 原serverchand
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
#### add hello world
git clone https://github.com/fw876/helloworld package/helloworld

#### add theme

#### remove duplicate app-ssr-plus
rm -rf package/openwrt-packages/luci-app-ssr-plus
rm -rf package/openwrt-packages/luci-app-jd-dailybonus

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
