#!/bin/sh

cp ./root/etc/xl2tpd.conf.template /etc/xl2tpd/
cp ./root/etc/chap-secrets.template /etc/ppp/
cp ./root/etc/options.bras.xl2tpd /etc/ppp/
cp ./root/etc/firewall.user /etc/

cp ./root/etc/config/bras /etc/config/
cp ./root/etc/init.d/bras /etc/init.d/


cp ./luasrc/controller/bras.lua /usr/lib/lua/luci/controller/
cp ./luasrc/model/cbi/bras.lua /usr/lib/lua/luci/model/cbi/
