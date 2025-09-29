# Makefile to create p7zip for LEDE/OpenWRT
#
# Copyright (C) 2017- Darcy Hu <hot123tea123@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=p7zip
PKG_VERSION:=17.06
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/p7zip-project/p7zip/archive/
PKG_HASH:=c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1

include $(INCLUDE_DIR)/package.mk

define Package/p7zip
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=p7zip archiver
  URL:=http://http://www.7-zip.org
  DEPENDS:=+libstdcpp
endef

MAKE_FLAGS += 7z

define Package/p7zip/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) -r $(PKG_BUILD_DIR)/bin/ $(1)/usr/lib/p7zip

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) ./files/7z $(1)/usr/bin
endef

$(eval $(call BuildPackage,p7zip))

