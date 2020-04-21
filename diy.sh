#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.2.254/g' package/base-files/files/bin/config_generate
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small
git clone https://github.com/xujianjie1213/openwrt-smartdns package/openwrt-smartdns
rm -rf package/lean/luci-theme-argon
sed -i 's/LuCI Master/LuCI master by Rylan/g' /usr/lib/lua/luci/version.lua
sed -i '/luciversion/d' /usr/lib/lua/luci/version.lua
echo 'luciversion = "19.07"' >> /usr/lib/lua/luci/version.lua
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
./scripts/feeds update -a
./scripts/feeds install
