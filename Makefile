#
# Copyright (C) 2019 OpenWrt.org
#
# KFERMercer <KFER.Mercer@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=adguardhome
PKG_VERSION:=latest
PKG_RELEASE:=1

STRIP:=true

ifeq ($(ARCH),i386)
	PKG_ARCH:=86
endif

ifeq ($(ARCH),x86_64)
	PKG_ARCH:=amd64
endif

ifeq ($(ARCH),mipsel)
	PKG_ARCH:=mipsle
endif

ifeq ($(ARCH),mips)
	PKG_ARCH:=mipsle
endif

ifeq ($(ARCH),arm)
ifeq ($(BOARD),bcm53xx)
	PKG_ARCH:=armv5
else ifeq ($(BOARD),kirkwood)
	PKG_ARCH:=armv5
else
	PKG_ARCH:=armv7
endif
endif

PKG_SOURCE:=AdGuardHome_linux_$(PKG_ARCH).tar.gz
PKG_SOURCE_URL:=https://static.adguard.com/adguardhome/beta/
PKG_BUILD_DIR:=$(BUILD_DIR)/AdGuardHome_linux_$(PKG_ARCH)
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Network-wide ads & trackers blocking DNS server
	URL:=https://github.com/AdguardTeam/AdGuardHome
endef


define Package/$(PKG_NAME)/description
Network-wide ads & trackers blocking DNS server
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/AdGuardHome
	$(INSTALL_BIN) $(BUILD_DIR)/AdGuardHome/AdGuardHome $(1)/usr/bin/AdGuardHome/AdGuardHome
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
