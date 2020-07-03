#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#### Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

#### add ext luci-app
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan

#### add theme
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
#git clone https://github.com/apollo-ng/luci-theme-darkmatter.git

#### remove duplicate app-ssr-plus
rm -rf package/openwrt-packages/luci-app-ssr-plus

#### modify luc display 
sed -i 's/LuCI Master/LuCI master by dqylyln/g' /usr/lib/lua/luci/version.lua
sed -i '/luciversion/d' /usr/lib/lua/luci/version.lua
echo 'luciversion = "19.07"' >> /usr/lib/lua/luci/version.lua

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
