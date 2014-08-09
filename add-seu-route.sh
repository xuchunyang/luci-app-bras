#!/bin/sh
# add-seu-route-linux.sh - public domain - Chunayng Xu | http://xuchunyang.me
# Program: 添加东南大学路由表 (openWRT)
# Usage: 添加路由表: sudo add-seu-route.sh GATEWAY

#-------------------------------------------------------------------------------
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root or use sudo"
    exit 1
fi

#-------------------------------------------------------------------------------
# Make sure only root can run our script
if [[ "$1" == "" ]]; then
    echo "This script need gateway as first argument"
    exit 1
else
    GATEWAY=$1
fi

#-------------------------------------------------------------------------------
add_route () {
    route add -net 58.192.114.8  netmask 255.255.255.255 gw $GATEWAY 2> /dev/null
    route add -net 10.0.0.0      netmask 255.0.0.0       gw $GATEWAY 2> /dev/null
    route add -net 58.192.112.0  netmask 255.255.240.0   gw $GATEWAY 2> /dev/null
    route add -net 58.192.112.39 netmask 255.255.255.255 gw $GATEWAY 2> /dev/null
    route add -net 121.229.0.0   netmask 255.255.0.0     gw $GATEWAY 2> /dev/null
    route add -net 121.248.48.0  netmask 255.255.240.0   gw $GATEWAY 2> /dev/null
    route add -net 202.119.24.55 netmask 255.255.255.255 gw $GATEWAY 2> /dev/null
    route add -net 211.65.32.0   netmask 255.255.224.0   gw $GATEWAY 2> /dev/null
    route add -net 211.65.232.0  netmask 255.255.252.0   gw $GATEWAY 2> /dev/null
}

# Make sure connection to gateway alive
if ! ping -c 1 -W 1 $GATEWAY > /dev/null; then
    echo "Cannot connect to ${GATEWAY}, check your gateway!"
    exit 1
else
    add_route
    exit 0
fi
