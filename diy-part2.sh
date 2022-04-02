#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ngrokc package/luci-app-ngrokc
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ngrokc package/ngrokc
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}

./scripts/feeds update -a
./scripts/feeds install -a
