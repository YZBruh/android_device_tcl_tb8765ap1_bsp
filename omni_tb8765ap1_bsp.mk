$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/tcl/tb8765ap1_bsp/device.mk)

# Device info
PRODUCT_DEVICE := tb8765ap1_bsp
PRODUCT_NAME := omni_tb8765ap1_bsp
PRODUCT_BRAND := TCL
PRODUCT_MODEL := 8088X
PRODUCT_MANUFACTURER := tcl

PRODUCT_GMS_CLIENTID_BASE := android-alcatel-rev1
