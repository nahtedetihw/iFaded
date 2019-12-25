ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

DEBUG = 0

TWEAK_NAME = iFaded
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

ifaded_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ifadedprefs
include $(THEOS_MAKE_PATH)/aggregate.mk