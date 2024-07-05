#
# Copyright (c) 2024 StatiXOS
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device specific configuration
$(call inherit-product, device/xiaomi/xiaomi14/pineapple.mk)

# Inherit some common StatiX stuff.
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)

# Include Pixel Launcher
INCLUDE_PIXEL_LAUNCHER := true

PRODUCT_NAME := statix_xiaomi14
PRODUCT_DEVICE := xiaomi14
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := xiaomi14
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi