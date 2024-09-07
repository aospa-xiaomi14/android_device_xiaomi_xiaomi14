#
# Copyright (C) 2024 The LineageOS Project
# Copyright (C) 2024 StatiXOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from houji device
$(call inherit-product, device/xiaomi/houji/device.mk)

# Inherit some common StatiX stuff.
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)

PRODUCT_NAME := statix_houji
PRODUCT_DEVICE := houji
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 23127PN0CG

PRODUCT_SYSTEM_NAME := houji_global
PRODUCT_SYSTEM_DEVICE := houji

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="houji_global-user 14 UKQ1.230804.001 V816.0.12.0.UNCMIXM release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := Xiaomi/houji_global/houji:14/UKQ1.230804.001/V816.0.12.0.UNCMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
