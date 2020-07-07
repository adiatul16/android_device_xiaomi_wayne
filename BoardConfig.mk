#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

DEVICE_PATH := device/xiaomi/wayne

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm660
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno512

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)

# Crypto
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1 swiotlb=1 androidboot.configfs=true
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a800000.dwc3 buildvariant=eng
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 console=ttyMSM0,115200,n8 earlycon=msm_serial_dm,0xc170000
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_SECOND_OFFSET      := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/Image.gz-dtb
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Fix for slow eMMC
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := wayne

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 120
TW_EXTRA_LANGUAGES := true
# NTFS and ExFAT support
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true

TW_IGNORE_MISC_WIPE_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SCREEN_BLANK_ON_BOOT := true

# Toolbox instead of busybox
#TW_FORCE_USE_BUSYBOX := true
TW_USE_TOOLBOX := true
# EDL Button
TW_HAS_EDL_MODE := true
# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
