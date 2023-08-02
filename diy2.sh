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
git https://github.com/kenzok8/small-package package/small-package
rm -rf package/small-package/firewall
rm -rf package/small-package/firewall4

#### add theme


#### customize personal info
echo '修改主机名称'
sed -i 's/OpenWrt/HomeNet/g' package/base-files/files/bin/config_generate
echo '修改banner'
rm -rf package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/xujianjie1213/openwrt-actions/master/banner -O package/base-files/files/etc/banner

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
