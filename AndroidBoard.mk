LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Host compiler configs
#----------------------------------------------------------------------
TARGET_HOST_COMPILER_PREFIX_OVERRIDE := prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-
TARGET_HOST_CC_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)gcc
TARGET_HOST_CXX_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)g++
TARGET_HOST_AR_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)ar
TARGET_HOST_LD_OVERRIDE := $(TARGET_HOST_COMPILER_PREFIX_OVERRIDE)ld

#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)
ifneq ($(strip $(TARGET_SIGNONLY_BOOTLOADER)),true)

# Compile
include bootable/bootloader/edk2/AndroidBoot.mk

$(INSTALLED_BOOTLOADER_MODULE): $(TARGET_EMMC_BOOTLOADER) | $(ACP)
else
TARGET_EMMC_BOOTLOADER := $(TARGET_BOARD_UNSIGNED_ABL_DIR)/unsigned_abl.elf
SIGN_ABL := $(PRODUCT_OUT)/abl.elf

SECTOOLSV2_BIN := $(QCPATH)/sectools/Linux/sectools
define sec-image-generate
        echo "Generating signed appsbl using secimagev2 tool"
        rm -rf $(PRODUCT_OUT)/abl.elf
        ( $(SECTOOLSV2_BIN) secure-image $(TARGET_EMMC_BOOTLOADER) \
                --outfile $(PRODUCT_OUT)/abl.elf \
                --image-id ABL \
                --security-profile $(SECTOOLS_SECURITY_PROFILE) \
                --sign \
                --signing-mode TEST \
                > $(PRODUCT_OUT)/secimage.log 2>&1 )
        echo "Completed secimagev2 signed appsbl (ABL) (logs in $(PRODUCT_OUT)/secimage.log)"
endef

$(SIGN_ABL): $(TARGET_EMMC_BOOTLOADER)
	$(call sec-image-generate)
$(INSTALLED_BOOTLOADER_MODULE): $(SIGN_ABL) | $(ACP)
endif

#   $(transform-prebuilt-to-target)
$(BUILT_TARGET_FILES_PACKAGE): $(INSTALLED_BOOTLOADER_MODULE)

droidcore: $(INSTALLED_BOOTLOADER_MODULE)
droidcore-unbundled: $(INSTALLED_BOOTLOADER_MODULE)
endif

#----------------------------------------------------------------------
# Copy additional target-specific files
#----------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
ifeq ($(ENABLE_AB), true)
    LOCAL_SRC_FILES := fstab.qcom
else
    LOCAL_SRC_FILES := fstab_non_AB.qcom
endif
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
ifeq ($(ENABLE_AB), true)
    LOCAL_MODULE       := charger_fw_fstab.qti
else
    LOCAL_MODULE       := charger_fw_fstab_non_AB.qti
endif
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := charger_fw_fstab.qti
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include device/qcom/vendor-common/MergeConfig.mk

#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(notdir $(wildcard $(radio_dir)/*))
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))
endif

#----------------------------------------------------------------------
# Configs common to AndroidBoard.mk for all targets
#----------------------------------------------------------------------
include vendor/qcom/opensource/core-utils/build/AndroidBoardCommon.mk

#----------------------------------------------------------------------
# wlan specific
#----------------------------------------------------------------------
ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
include device/qcom/wlan/kalama/AndroidBoardWlan.mk
endif
