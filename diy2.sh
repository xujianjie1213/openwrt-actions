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


#### add theme


#### customize personal info
echo '修改主机名称'
sed -i 's/OpenWrt/HomeNet/g' package/base-files/files/bin/config_generate
echo '修改banner'
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/


#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
