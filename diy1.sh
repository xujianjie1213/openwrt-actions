#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
rm -rf package/openwrt-packages/luci-app-ssr-plus
./scripts/feeds update -a
./scripts/feeds install