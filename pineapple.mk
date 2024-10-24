#
# Copyright (c) 2024 Paranoid Android
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
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

QTI_CAMERA_PROVIDER_SERVICE := 2.7
QTI_CAMERA_AON_SERVICE := 1.2

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Compatibility
NEED_AIDL_NDK_PLATFORM_BACKEND := true

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger_fw_fstab.qti:$(TARGET_COPY_OUT_VENDOR)/etc/charger_fw_fstab.qti

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

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

# FBO
PRODUCT_PACKAGES += \
    libext2_uuid.vendor

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

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-V5-ndk.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    init.xiaomi.rc

# Kernel
TARGET_KERNEL_VERSION := 6.1
KERNEL_PREBUILT_DIR := device/xiaomi/xiaomi14-kernel

# Keymint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.keymaster-V3-ndk.vendor \
    android.hardware.keymaster-V4-ndk.vendor \
    android.hardware.security.keymint-V2-ndk.vendor \
    android.hardware.security.keymint-V3-ndk.vendor \
    android.hardware.security.rkp-V3-ndk.vendor \
    android.hardware.security.sharedsecret-V1-ndk.vendor \
    lib_android_keymaster_keymint_utils.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Media
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.2.venodr

# Opt out of 16K alignment changes
PRODUCT_MAX_PAGE_SIZE_SUPPORTED := 4096

# Perf
TARGET_DISABLE_PERF_OPTIMIZATIONS := false

# Processgroup
USE_LIB_PROCESS_GROUP := true

#### Props ####
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

# QTI components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    overlay \
    perf \
    telephony \
    usb \
    wfd \
    wlan

# RRO configuration
TARGET_USES_RRO := true

# Runtime
PRODUCT_PACKAGES += \
    libandroid_runtime_lazy.vendor

# SMCI-Listeners
TARGET_ENABLE_SMCI_SYSLISTENER := true

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_pineapple/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    android.frameworks.sensorservice-V1-ndk.vendor \
    libsensorndkbridge.vendor

# Shipping API
SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34
BOARD_SHIPPING_API_LEVEL := 34

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# SystemExt
SYSTEMEXT_SEPARATE_PARTITION_ENABLE := true

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.mbms.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.mbms.xml

# Tensorflow
PRODUCT_PACKAGES += \
    libflatbuffers-cpp.vendor

# USB
TARGET_HAS_DIAG_ROUTER := true

# VM
TARGET_ENABLE_VM_SUPPORT := true

# VNDK
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
BOARD_VNDK_VERSION := current
RECOVERY_SNAPSHOT_VERSION := current
RAMDISK_SNAPSHOT_VERSION := current

# Verified boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)
PRODUCT_VENDOR_PROPERTIES += ro.virtual_ab.compression.threads=true
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

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
