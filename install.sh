#!/bin/sh
# TODO: Add more explanation

# Sample xl2tpd configure
cp ./etc/xl2tpd.conf.template /etc/xl2tpd/
cp ./etc/chap-secrets.template /etc/ppp/
cp ./etc/options.bras.xl2tpd /etc/ppp/

# Luci stuff (do real things)
cp ./etc/config/bras /etc/config/
cp ./etc/init.d/bras /etc/init.d/

# Bras Web Interface
cp  ctr-bras.lua   /usr/lib/lua/luci/controller/bras.lua
cp  model-bras.lua /usr/lib/lua/luci/model/cbi/bras.lua

# Sample firewall configure
cp ./etc/firewall.user /etc/
