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

sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$lDRVkTLs$EUprnJdwldZBax.6Osjxo0:18190:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

sed -i 's/echo '"'"'iptables/echo '"'"'# iptables/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/echo '"'"'\[ -n/echo '"'"'# \[ -n/g' package/lean/default-settings/files/zzz-default-settings

sed -i '/uci commit fstab/a\
\
uci set network.lan.ipaddr=\"192.168.16.1\"\
uci set network.lan.netmask=\"255.255.255.0\"\
uci set network.wan.proto=\"pppoe\"\
uci set network.wan.username=\"18121400153\"\
uci set network.wan.password=\"07331167\"\
uci set network.wan.ifname=\"eth1\"\
uci set network.wan6.ifname=\"eth1\"\
uci commit network' package/lean/default-settings/files/zzz-default-settings

sed -i '/log-facility=\/dev\/null/a\
echo \"\" >> /etc/dnsmasq.conf\
echo \"# IPTV\" >> /etc/dnsmasq.conf\
echo \"dhcp-option-force=125,00:00:00:00:14:02:06:48:47:57:2D:43:54:0A:02:20:00:0B:02:00:55:0D:02:00:2E\" >> /etc/dnsmasq.conf\
echo \"dhcp-option=15\" >> /etc/dnsmasq.conf\
echo \"dhcp-option=28\" >> /etc/dnsmasq.conf' package/lean/default-settings/files/zzz-default-settings
