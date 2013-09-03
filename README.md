luci-app-Bras
=============

目前 `luci-app-Bras` 只提供源码包，程序通过 `shell` 和 [Lua][1] 控制 xl2tpd 进行 Bras 拨号，因此并不需要编译成 `ipk` 文件再安装到 `OpenWrt`。
程序正常工作依赖于以下两个条件：
1. 路由器安装了 `OpenWＷt` 。并不局限于路由器的型号和 `OpenWrt` 的版本。
2. 只要路由器能够连上校内网，并不局限于路由器的物理位置。


如何安装
-------

首先把安装文件拷贝到 `OpenWrt`, 之后使用 `SSH` 登录路由器，安装依赖 `xl2tpd` 和 `luci-app-Bras`。
以下是一个安装示例，其中 `192.168.1.1` 为路由器的 `IP` 。

1. 拷贝依赖 `xl2tpd` 安装包和 `luci-app-Bras` 到路由器。
   ```
   $ scp xl2tpd_version_arch.ipk root@192.168.1.1:/tmp
   scp -r luci-bras-app-master root@192.168.1.1:/tmp
   ```

2. 使用 `ssh` 登录路由器，安装依赖 `xl2tpd`
   ```
   ssh root@192.168.1.1
   opkg install /tmp/xl2tpd_version_arch.ipk
   ```
3. 再安装 `luci-app-Bras`
   ```
   cd /tmp/luci-bras-app-master
   ./install.sh
   ```

如何使用
--------
安装之后需要重启一次路由器。使用前需要连上校内网。可以通过 `ping seu.edu.cn` 进行确认。
之后使用浏览器登录路由器，进入 管理界面 -> 服务 -> BRAS。

![Luci-app-Bras usage](https://raw.github.com/xuchunyang/luci-app-bras/master/images/luci-app-bras.png)

![Luci-app-Bras status](https://raw.github.com/xuchunyang/luci-app-bras/master/images/status.png)

其他
----
需要强调的是 `luci-app-Ｂras`只是 [xl2tpd][5] 的一个前端，另外我在写 `luci-app-Bras` 的过程中参考了 [luci-app-vpnc][6] 项目。
如果你在使用中遇到了问题，可以使用 `OpenWrt` 提供的 `uci` 工具查看或者修改配置。
1. 打印用户名密码和初始网关
```
uci show bras
```
```
cat /tmp/ORIG_GATEWAY
```
2. 修改信息，并写入文件
```
uci set bras.@bras[0].username=213110678@b
```
```
uci set bras.@bras[0].password=123456
```
```
echo "your original" > /tmp/ORIG_GATEWAY
```
```
set commit bras
```
3. 启动和停止
```
/etc/init.d/bras start
```
```
/etc/init.d/bras stop
```

另外如果你在使用中遇到了问题，可以到 [SBBS][4] 的 Linux 版提问。

[1]: http://en.wikipedia.org/wiki/Lua
[2]: http://www.chiark.greenend.org.uk/~sgtatham/putty/
[3]: http://www.netsarang.com/products/xsh_overview.html
[4]: http://bbs.seu.edu.cn
[5]: https://github.com/xelerance/xl2tpd
