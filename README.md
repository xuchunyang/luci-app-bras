## About

[luci-app-bras](https://github.com/xuchunyang/luci-app-bras) 是东南大学 Bras 的 OpenWRT 客户端。

## Dependency


* xl2tpd


## Installation

在 [Releases](https://github.com/xuchunyang/luci-app-bras/releases) 下载安装包


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


## License

luci-app-bras 在 [MIT license](https://raw.github.com/xuchunyang/luci-app-bras/master/LICENSE.txt) 下发布。
