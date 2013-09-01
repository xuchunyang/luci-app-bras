luci-app-Bras
=============

目前 `luci-app-Bras` 只提供源码包，程序通过 `shell` 和 [Lua][1] 控制 xl2tpd 进行 Bras 拨号，因此并不需要编译成 `ipk` 文件再安装到 `OpenWrt`。

如何安装
-------

安装时需要使用 `SSH`， 在 ‘Unix-like` 系统上直接打开终端， `Windows` 下需要自行安装 [PuTTY][2] 和 [Xshell][3] 之类的 ‘SSH’ 客户端。
安装前需要下载与对应平台的 `xl2tpd` 的 `ipk` 文件。

1. 拷贝 `xl2tpd` 和 `luci-app-Bras` 到路由器，比如
   ```
   scp xl2tpd_version_arch.ipk root@192.168.1.1:/tmp
   scp -r luci-bras-app-master root@192.168.1.1:/tmp
   ```

2. 使用 `ssh` 登录路由器，安装依赖 `xl2tpd`
   ```
   ssh root@192.168.1.1
   opkg install /tmp/xl2tpd_version_arch.ipk
   ```
3. 安装 `luci-app-Bras`
   ```
   cd /tmp/luci-bras-app-master
   ./install.sh
   ```

如何使用
--------

首次安装之后需要重启路由器或者手动更新 `iptable` 。之后，使用浏览器登录路由器，进入 管理界面 -> 服务 -> BRAS。

![Luci-app-Bras Web GUI](https://raw.github.com/xuchunyang/luci-app-bras/master/image/luci-app-bras.png)

其他
----
如果你在使用中遇到了任何问题，都可以到 [SBBS][4] 的 Linux 版提问，也可以电邮我。
我的邮箱: xuchunyang56@gmail.com

[1]: http://en.wikipedia.org/wiki/Lua
[2]: http://www.chiark.greenend.org.uk/~sgtatham/putty/
[3]: http://www.netsarang.com/products/xsh_overview.html
[4]: http://bbs.seu.edu.cn
