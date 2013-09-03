luci-app-bras
=============

`luci-app-bras`是适用于`OpenWrt`的`BRAS`服务Web前端，目前仅支持东南大学`BRAS`服务，程序正常工作依赖于以下两个条件：

1. 路由器刷了`OpenWrt`，不局限于路由器的型号和`OpenWrt`的版本。

2. 路由器能够连上校内网，也不局限于路由器的物理位置。


如何安装
-------
本程序依赖于`xl2tpd`，需要自行安装。

```
cd /path/to/luci-bras-app-master
./install.sh
```

如何使用
--------
安装之后需要重启一次路由器。使用前需要连上校内网。可以通过`ping bras.seu.edu.cn`进行确认。
之后使用浏览器登录路由器，进入 管理界面 -> 服务 -> BRAS。

![Luci-app-Bras usage](https://raw.github.com/xuchunyang/luci-app-bras/master/images/luci-app-bras.png)

![Luci-app-Bras status](https://raw.github.com/xuchunyang/luci-app-bras/master/images/status.png)

其他
----
如果你在使用中遇到了问题，可以结合使用`OpenWrt`提供的`uci`工具查看或者修改配置，进行手动控制。

1. 打印用户名密码和初始网关
  ```
   uci show bras
   cat /tmp/ORIG_GATEWAY
  ```
2. 修改信息，并写入文件
  ```
   uci set bras.@bras[0].username=213110678@b
   uci set bras.@bras[0].password=123456
   echo "your original" > /tmp/ORIG_GATEWAY
   set commit bras
  ```
3. 启动和停止
  ```
   /etc/init.d/bras start
   /etc/init.d/bras stop
  ```
同时你也可以到 [SBBS][4] 的 Linux 版发帖提问。另外，我在写`luci-app-bras`的过程中参考了 [luci-app-vpnc][6] 项目，从中的得到了很多启发。

[1]: http://en.wikipedia.org/wiki/Lua
[2]: http://www.chiark.greenend.org.uk/~sgtatham/putty/
[3]: http://www.netsarang.com/products/xsh_overview.html
[4]: http://bbs.seu.edu.cn
[5]: https://github.com/xelerance/xl2tpd
[6]: https://github.com/tombatossals/luci-app-vpnc‎
