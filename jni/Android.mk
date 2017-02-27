NDK_TOOLCHAIN_VERSION := 4.9

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := lusb
LOCAL_SRC_FILES := libs/libusb.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE:= libusb-compat
LOCAL_SRC_FILES:= libusb/core.c 
LOCAL_C_INCLUDES := $(LOCAL_PATH)/includes \
		    $(LOCAL_PATH)/android 

LOCAL_CFLAGS += -W -Wall
LOCAL_CFLAGS += -fPIC -DPIC

ifeq ($(TARGET_BUILD_TYPE),release)
	LOCAL_CFLAGS += -O2
endif

LOCAL_STATIC_LIBRARIES += lusb
include $(BUILD_STATIC_LIBRARY)


		

