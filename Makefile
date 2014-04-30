include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-bras
PKG_VERSION=0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-bras
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=SEU Bras Client for LuCI
	PKGARCH:=all
endef

define Package/luci-app-bras/description
	This package contains LuCI configuration pages for SEU Bras Client.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-bras/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/etc/xl2tpd/
	$(INSTALL_DIR) $(1)/etc/ppp/

# Sample xl2tpd configure etc/ppp/options.bras.xl2tpd
	$(INSTALL_CONF) ./etc/xl2tpd/xl2tpd.conf.template $(1)/etc/xl2tpd/xl2tpd.conf.template
	$(INSTALL_CONF) ./etc/ppp/chap-secrets.template  $(1)/etc/ppp/chap-secrets.template
	$(INSTALL_CONF) ./etc/ppp/options.bras.xl2tpd $(1)/etc/ppp/options.bras.xl2tpd
	$(INSTALL_CONF) ./etc/config/bras $(1)/etc/config/bras
	$(INSTALL_BIN) ./etc/init.d/bras $(1)/etc/init.d/bras
	$(INSTALL_DATA) ./usr/lib/lua/luci/model/cbi/bras.lua $(1)/usr/lib/lua/luci/model/cbi/bras.lua
	$(INSTALL_DATA) ./usr/lib/lua/luci/controller/bras.lua $(1)/usr/lib/lua/luci/controller/bras.lua
endef

$(eval $(call BuildPackage,luci-app-bras))
