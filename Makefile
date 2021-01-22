ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = MobileSafari Google

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WoahDontShareThat

WoahDontShareThat_FILES = Tweak.xm
WoahDontShareThat_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += woahdontsharethatprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
