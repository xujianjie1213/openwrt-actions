#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
#### Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#### add theme
git clone --depth=1 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom

#### 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/$orig_version/R$date_version/g" package/lean/default-settings/files/zzz-default-settings

#### customize personal info
echo '修改主机名称'
sed -i 's/OpenWrt/HomeNet/g' package/base-files/files/bin/config_generate
echo '修改banner'
rm -rf package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/xujianjie1213/openwrt-actions/master/banner -O package/base-files/files/etc/banner

#### update and install feeds
./scripts/feeds update -a
./scripts/feeds install
