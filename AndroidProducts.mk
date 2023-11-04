#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_tb8765ap1_bsp.mk

COMMON_LUNCH_CHOICES := \
    twrp_tb8765ap1_bsp-user \
    twrp_tb8765ap1_bsp-userdebug \
    twrp_tb8765ap1_bsp-eng
