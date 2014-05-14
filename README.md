## About

[luci-app-bras](https://github.com/xuchunyang/luci-app-bras)是一个东南大学Bras的OpenWRT路由器客户端，主要包括了xl2tpd的配置模板、东南大学校内路由表和Web控制界面。

利用该工具，你可以使用浏览器控制Bras，并且通过设置防火墙转发规则，通过WLAN接入的设备能共享Bras。

## Dependency

* xl2tpd

## Installation

在[Releases](https://github.com/xuchunyang/luci-app-bras/releases)下载安装包。

```bash
# 1. 安装 luci-app-bras
$ opkg install luci-app-bras_0.1-1_all.ipk

# 2. 添加防火墙转发规则，参见firewall.user
```

## TODO

- [x] Clean source code
- [x] Package (no plan for this)
- [x] Rewrite README page (maybe a github page, if necessary)
- [x] Fix ppp interface problem
- [ ] Clean messy shell script
- [ ] Tweak Web UI

## Known issues

参见[issue](https://github.com/xuchunyang/luci-app-bras/issues?state=open)页面

## License

luci-app-bras在[MIT license](https://raw.github.com/xuchunyang/luci-app-bras/master/LICENSE.txt)下发布。
