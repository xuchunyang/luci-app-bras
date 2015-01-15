## About

Southeast University BRAS interface for OpenWRT

## Dependency

* xl2tpd

## Installation

1. Clone this repo
2. Change the route IP in `etc/firewall.user` to yours (the default is *192.168.1.0*)
3. Copy this repo directory to your openWRT
4. Login your openWRT and `cd` to the directory to run `sh ./install.sh`

Now, you can manage your bras using LUCI.

## License

[MIT license](https://raw.github.com/xuchunyang/luci-app-bras/master/LICENSE.txt)
