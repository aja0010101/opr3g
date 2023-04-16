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
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
mkdir -p files/etc/hotplug.d/block && curl -fsSL https://raw.githubusercontent.com/281677160/openwrt-package/usb/block/10-mount > files/etc/hotplug.d/block/10-mount
# rm -rf target/linux/ath79/image/tiny-tp-link.mk
# rm -rf target/linux/ath79/dts/ar9331_tplink_tl-wr703n_tl-mr10u.dtsi
# wget https://am.sohaha.xyz/tp703/tiny-tp-link.mk -O target/linux/ath79/image/tiny-tp-link.mk
# wget https://am.sohaha.xyz/tp703/ar9331_tplink_tl-wr703n_tl-mr10u.dtsi -O target/linux/ath79/dts/ar9331_tplink_tl-wr703n_tl-mr10u.dtsi
rm -rf ./feeds/packages/lang/golang
svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
