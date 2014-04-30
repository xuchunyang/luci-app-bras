# luci-app-bras

`luci-app-bras`是适用于`OpenWrt`的 BRAS 服务的 Web 前端，目前仅支持东南大学 BRAS。

## Dependency

* xl2tpd

## Installation
    $ git clone https://github.com/XuChunyang/luci-app-bras.git

    将luci-app-bras移动到路由器(e.g. 192.168.1.1):

    $ scp luci-app-bras root@192.168.1.1:/tmp

    登录到路由器，安装:

    $ ssh root@192.168.1.1
    $ cd /tmp/luci-bras-app
    $ sh install.sh

## TODO
- [x] Clean source code
- [ ] Chinese translation
- [ ] Rewrite UI
- [ ] Rewrite README page (maybe a github page, if necessary)
- [ ] Package (no plan for this)
