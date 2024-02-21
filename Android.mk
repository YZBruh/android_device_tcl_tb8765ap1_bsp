LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tb8765ap1_bsp)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
