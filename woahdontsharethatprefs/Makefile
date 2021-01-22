ARCHS = arm64 arm64e

TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = WoahDontShareThatPrefs

WoahDontShareThatPrefs_FILES = WDSTRootListController.m
WoahDontShareThatPrefs_FRAMEWORKS = UIKit
WoahDontShareThatPrefs_PRIVATE_FRAMEWORKS = Preferences
WoahDontShareThatPrefs_INSTALL_PATH = /Library/PreferenceBundles
WoahDontShareThatPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
