### 关于

东南大学Bras OpenWRT路由器客户端。

### 安装
```shell
$ wget https://github.com/xuchunyang/luci-app-bras/releases/download/v0.9-alpha/luci-app-bras_0.1-1_all.ipk
$ opkg install luci-app-bras_0.1-1_all.ipk
# Note: xl2tpd 不是安装该包的依赖，也就是说，安装xl2tpd和luci-app-bras的先后顺序没所谓。
```

### TODO
- [x] Clean source code
- [x] Package (no plan for this)
- [x] Rewrite README page (maybe a github page, if necessary)
- [x] Fix ppp interface problem
- [ ] Clean messy shell script

### 已知的问题
参见issue页面
