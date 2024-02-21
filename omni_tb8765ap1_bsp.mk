# Call makefiles
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/omni/config/common.mk)

# Device info
PRODUCT_DEVICE := tb8765ap1_bsp
PRODUCT_NAME := omni_tb8765ap1_bsp
PRODUCT_BRAND := TCL
PRODUCT_MODEL := 8088X
PRODUCT_MANUFACTURER := tcl

# GMS 
PRODUCT_GMS_CLIENTID_BASE := android-alcatel-rev1
