#
# Copyright (c) 2024 StatiXOS
#

# Blobs device specific first
$(call inherit-product, vendor/xiaomi/xiaomi14/xiaomi14-vendor.mk)

TARGET_BOARD_PLATFORM := pineapple
TARGET_BOOTLOADER_BOARD_NAME := pineapple

BUILD_BROKEN_DUP_RULES := true

RELAX_USES_LIBRARY_CHECK := true

# 64bit
TARGET_SUPPORTS_64_BIT_ONLY := true

# A/B
ENABLE_AB := true

PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

PRODUCT_PACKAGES += \
  update_engine_sideload \
  checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# ANT+ stack
PRODUCT_PACKAGES += \
    libvolumelistener

# Board
QCOM_BOARD_PLATFORMS += pineapple
TARGET_USES_QCOM_BSP := false
TARGET_USES_QSSI := true

# Camera
QTI_CAMERA_PROVIDER_SERVICE := 2.7
QTI_CAMERA_AON_SERVICE := 1.2

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Compatibility
NEED_AIDL_NDK_PLATFORM_BACKEND := true

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger_fw_fstab.qti:$(TARGET_COPY_OUT_VENDOR)/etc/charger_fw_fstab.qti

# Common
$(call inherit-product, device/qcom/vendor-common/common64.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Debugfs
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Dumpstate Feature Flag
PRODUCT_ENABLE_DUMPSTATE_SUPPORT := true

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Emulated storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot-service.example_recovery

# Fingerprint feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GKI
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Graphics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# ION
TARGET_USES_NEW_ION := true

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Kernel
TARGET_KERNEL_VERSION := 6.1

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Opt out of 16K alignment changes
PRODUCT_MAX_PAGE_SIZE_SUPPORTED := 4096

# Perf
TARGET_DISABLE_PERF_OPTIMIZATIONS := false

# Processgroup
USE_LIB_PROCESS_GROUP := true

#### Props ####
# SoC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.manufacturer=QTI

# privapp-permissions whitelisting (To Fix CTS :privappPermissionsMustBeEnforced)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce

# beluga settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.beluga.p=0x3 \
    ro.vendor.beluga.c=0x4800 \
    ro.vendor.beluga.s=0x900 \
    ro.vendor.beluga.t=0x240

# Below perf props should be part of vendor/build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.perf-hal.ver=3.0 \
    ro.vendor.perf.scroll_opt=1 \
    vendor.perf.framepacing.enable=1

# Incremental fs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.incremental.enable=yes

# system prop for enabling QFS (QTI Fingerprint Solution)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qfp=true
#target specific runtime prop for qspm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qspm.enable=true

# Vendor property to enable advanced network scanning
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.enableadvancedscan=true

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Mediaserver 64 Bit enable
PRODUCT_PROPERTY_OVERRIDES += \
     ro.mediaserver.64b.enable=true

########

# QC AV
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# QRTR related packages
PRODUCT_PACKAGES += qrtr-ns
PRODUCT_PACKAGES += qrtr-lookup
PRODUCT_PACKAGES += libqrtr

# QCV allows multiple chipsets to be supported on a single vendor.
# Add vintf device manifests for chipsets in pineapple QCV family below.
TARGET_USES_QCV := true

# QSPA service
PRODUCT_PACKAGES += \
    qspa-testclient \
    qspa_vendor.rc \
    vendor.qti.qspa-service

# RRO configuration
TARGET_USES_RRO := true

# SMCI-Listeners
TARGET_ENABLE_SMCI_SYSLISTENER := true

# Shipping API
SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34
BOARD_SHIPPING_API_LEVEL := 34
BOARD_API_LEVEL := 34

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SystemExt
SYSTEMEXT_SEPARATE_PARTITION_ENABLE := true

# USB
TARGET_HAS_DIAG_ROUTER := true

# VM
TARGET_ENABLE_VM_SUPPORT := true

# VNDK
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
BOARD_SYSTEMSDK_VERSIONS := 34
BOARD_VNDK_VERSION := current
RECOVERY_SNAPSHOT_VERSION := current
RAMDISK_SNAPSHOT_VERSION := current

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)
PRODUCT_VENDOR_PROPERTIES += ro.virtual_ab.compression.threads=true
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

# Virtualization
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/ueventd-odm.rc:$(TARGET_COPY_OUT_ODM)/etc/ueventd.rc

PRODUCT_PACKAGES += \
    vmmgr \
    vmmgr.rc \
    vmmgr.conf

# Wlan
include device/qcom/wlan/pineapple/wlan.mk

###################################################################################
# This is the End of target.mk file.
# Now, Pickup other split product.mk files:
###################################################################################
# TODO: Relocate the system product.mk files pickup into qssi lunch, once it is up.
$(foreach sdefs, $(sort $(wildcard vendor/qcom/defs/product-defs/system/*.mk)), \
    $(call inherit-product, $(sdefs)))
$(foreach vdefs, $(sort $(wildcard vendor/qcom/defs/product-defs/vendor/*.mk)), \
    $(call inherit-product, $(vdefs)))
###################################################################################
