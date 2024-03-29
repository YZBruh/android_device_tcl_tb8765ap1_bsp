DEVICE_PATH := device/tcl/tb8765ap1_bsp

# Special variable for prebuilt directory to provide faster access 
PREBUILT_DIR := $(DEVICE_PATH)/prebuilt

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

# arm32-binder-64 | a64
TARGET_USES_64_BIT_BINDER := true

# MediaTek SoC only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := tb8765ap1_bsp
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 213

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05000000
BOARD_KERNEL_TAGS_OFFSET := 0x04000000
BOARD_KERNEL_IMAGE_NAME := Image

BOARD_KERNEL_CMDLINE := \
       bootopt=64S3,32S1,32S1 \
       androidboot.selinux=permissive \
       androidboot.init_fatal_reboot_target=recovery \
       androidboot.trustkernel

TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_PREBUILT_KERNEL := $(PREBUILT_DIR)/kernel
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_DIR)/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 

BOARD_MKBOOTIMG_ARGS += \
        --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
        --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
        --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Boot and recovery partition sizes
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3584032768
BOARD_VENDORIMAGE_PARTITION_SIZE := 578813952
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false
TARGET_COPY_OUT_VENDOR := vendor

# AVB (Android Verified Boot)
BOARD_AVB_ENABLE := false

# Hardware
TARGET_BOARD_PLATFORM := mt6739

# Trustkernel - TrustyZone
TARGET_USES_TRUSTY := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/properties/system.prop

# Copy the twrp.flags into recovery image and remove vibrator libraries
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/recovery/root/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/etc/twrp.flags

PRODUCT_REMOVE_FILES += \
        $(TARGET_COPY_OUT_RECOVERY)/root/sbin/android.hardware.vibrator@1.0.so \
        $(TARGET_COPY_OUT_RECOVERY)/root/sbin/android.hardware.vibrator@1.1.so \
        $(TARGET_COPY_OUT_RECOVERY)/root/sbin/android.hardware.vibrator@1.2.so

TARGET_RECOVERY_DEVICE_MODULES := 

# Assert
TARGET_OTA_ASSERT_DEVICE := tb8765ap1_bsp,8088X,8088X_EEA

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2021-07-05
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# System-as-root and metadata
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_METADATA_PARTITION := true

# adapt new init
TARGET_INIT_VENDOR_LIB := libinit_tb8765ap1_bsp

# Recovery modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster3 \
    libpuresoftkeymasterdevice \
    libinit_tb8765ap1_bsp

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster3.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

TW_RECOVERY_ADDIONITAL_RELINK_LIBRARY_FILES := \
        $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster3device.so \
        $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

TW_RECOVERY_ADDIONITAL_RELINK_BINARY_FILES += \
        $(TARGET_OUT_EXECUTABLES)/teed

# TWRP Configuration
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_HAS_MTP := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_DEFAULT_LANGUAGE := en
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_REPACKTOOLS := true
TW_USE_TOOLBOX := true
TW_DEVICE_VERSION := tb8765ap1_bsp
TW_INCLUDE_NTFS_3G := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_APEX := true
TW_EXTRA_LANGUAGES := false

# Device
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 225
TW_DEFAULT_BRIGHTNESS := 80
# not supporting vibration
TW_EXCLUDE_VIBRATION := true
TW_NO_HAPTICS := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_RECOVERY_FORMAT_SUPPORTS_METADATA := true
TW_CRYPTO_REAL_BLKDEV := "/dev/block/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,"
TW_INCLUDE_REPACKTOOLS := true

# Crypto binary
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
