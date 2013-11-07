# luci-app-bras

`luci-app-bras`是适用于`OpenWrt`的BRAS服务的Web前端，目前仅支持东南大学BRAS。

## 依赖
本程序依赖于`xl2tpd`，需要自行安装。

## 安装:
    $ git clone https://github.com/XuChunyang/luci-app-bras.git

    将luci-app-bras移动到路由器(e.g. 192.168.1.1):

    $ scp luci-app-bras root@192.168.1.1:/tmp

    登录到路由器，安装:

    $ ssh root@192.168.1.1
    $ cd /tmp/luci-bras-app
    $ sh install.sh

## 使用

使用浏览器登录路由器，进入 管理界面 -> 服务 -> BRAS，开启/关闭BRAS。

## 注意

如果在使用中遇到了问题，可以结合使用`OpenWrt`提供的`uci`工具查看或者修改配置，手动控制BRAS:

    打印用户名密码和初始网关:

    $ uci show bras
    $ cat /tmp/ORIG_GATEWAY

    修改信息，并写入文件:

    $ uci set bras.@bras[0].username=213110678@b
    $ uci set bras.@bras[0].password=123456
    $ echo "your_original_gateway" > /tmp/ORIG_GATEWAY
    $ set commit bras

    启动和停止:

    $ /etc/init.d/bras start
    $ /etc/init.d/bras stop
