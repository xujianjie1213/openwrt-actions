sed -i 's/192.168.1.1/192.168.2.254/g' package/base-files/files/bin/config_generate
sed -i 's/LuCI Master/LuCI master by Rylan/g' /usr/lib/lua/luci/version.lua