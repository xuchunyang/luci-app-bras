### 关于

东南大学Bras OpenWRT路由器客户端。

### 安装
```bash
# 1. 安装 xl2tpd

# 2. 安装 luci-app-bras
$ wget https://github.com/xuchunyang/luci-app-bras/releases/download/v1.0/luci-app-bras_1.0-1_all.ipk
$ opkg install luci-app-bras_0.1-1_all.ipk

# 3. 添加防火墙转发规则，参见firewall.user
```

### TODO
- [x] Clean source code
- [x] Package (no plan for this)
- [x] Rewrite README page (maybe a github page, if necessary)
- [x] Fix ppp interface problem
- [ ] Clean messy shell script
- [ ] Tweak Web UI

### 已知的问题
参见[issue](https://github.com/xuchunyang/luci-app-bras/issues?state=open)页面
