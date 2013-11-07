#!/bin/sh

## Note: 如果你打算同时在路由器上拨ipv6test和BRAS，需要uncomment下面两行
# sed -e 's#ppp0#ppp1#g'  ./root/etc/init.d/bras > ./root/etc/config/bras
# sed -e 's#ppp0#ppp1#g'  ./root/etc/firewall.user > ./root/etc/firewall.user

## Note: 如果你的路由器的局域网不是192.168.1.0，修改"192.168.2.0"为你的路由器网域，并 uncomment 下面一行
# sed -e 's#192.168.1.0#192.168.2.1#g' ./root/etc/firewall.user > ./root/etc/firewall.user

cp ./root/etc/xl2tpd.conf.template /etc/xl2tpd/
cp ./root/etc/chap-secrets.template /etc/ppp/
cp ./root/etc/options.bras.xl2tpd /etc/ppp/
cp ./root/etc/firewall.user /etc/

cp ./root/etc/config/bras /etc/config/
cp ./root/etc/init.d/bras /etc/init.d/


cp ./luasrc/controller/bras.lua /usr/lib/lua/luci/controller/
cp ./luasrc/model/cbi/bras.lua /usr/lib/lua/luci/model/cbi/
