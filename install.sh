#!/bin/sh

cp ./etc/xl2tpd/xl2tpd.conf.template /etc/xl2tpd/
cp ./etc/ppp/chap-secrets.template /etc/ppp/
cp ./etc/ppp/options.bras.xl2tpd /etc/ppp/

cp ./etc/config/bras /etc/config/
cp ./etc/init.d/bras /etc/init.d/

cp ./usr/lib/lua/luci/controller/bras.lua /usr/lib/lua/luci/controller/
cp ./usr/lib/lua/luci/model/cbi/bras.lua /usr/lib/lua/luci/model/cbi/

cp ./etc/firewall.user /etc/
