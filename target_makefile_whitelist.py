# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear

VENDOR_SHELL_WHITELIST = {
    "device/qcom/common/init/Android.mk",
    "vendor/qcom/opensource/mmrm-driver/Android.mk",
    "vendor/qcom/opensource/touch-drivers/Android.mk",
    "vendor/qcom/opensource/video-driver/Android.mk",
    "vendor/qcom/opensource/wlan/qcacld-3.0/Android.mk",
    "vendor/qcom/opensource/wlan/utils/sigma-dut/Android.mk",
    "vendor/qcom/proprietary/Innopath/FOTA/MobileUpdateClient/Android.mk",
    "vendor/qcom/proprietary/ac_policy-noship/Android.mk",
    "vendor/qcom/proprietary/data-noship/qcril-data-utf/test/utf/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/common/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/samples/apps/camera_test/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/samples/apps/imu_test/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/samples/plugins/eyetracking/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/service/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/services/2dframework/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/services/sxr/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/tools/qvrdatalogger/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/tools/sensors_calibration/Android.mk",
    "vendor/qcom/proprietary/securemsm-internal/isdbtmm/test/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/bengal/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/holi/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/lahaina/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/sm6125/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/sm8150/Android.mk",
    "vendor/qcom/proprietary/ts_firmware-noship/taro/Android.mk",
    "vendor/qcom/proprietary/ts_firmware/taro/Android.mk",
    "vendor/qcom/proprietary/video/noship/hfi-test/driver/Android.mk",
    "vendor/qcom/proprietary/wigig-noship/location/libaoa/Android.mk",
    "vendor/qcom/proprietary/wigig/debug-tools/host_manager_11ad/Android.mk",
    "vendor/qcom/proprietary/wigig/debug-tools/lib/FlashAcss/Android.mk",
    "vendor/qcom/proprietary/wigig/debug-tools/lib/WlctPciAcss/Android.mk",
    "vendor/qcom/proprietary/wigig/debug-tools/lib/utils/Android.mk",
    "vendor/qcom/proprietary/wigig/debug-tools/shell_11ad/Android.mk",
    "vendor/qcom/proprietary/wigig/ftm_flows/ftm_flows_test/Android.mk",
    "vendor/qcom/proprietary/wigig/ftm_flows/libwigig_ftm_flows/Android.mk",
    "vendor/qcom/proprietary/wigig/sensing/sensingdaemon/Android.mk",
    "vendor/qcom/proprietary/wlan/utils/halproxydaemon/Android.mk",
    "vendor/qcom/proprietary/wlan/utils/qsh_wifi_test/Android.mk",
}

VENDOR_RM_WHITELIST = {
    "vendor/qcom/proprietary/biometrics/fingerprint/QFPCalibration/Android.mk",
    "vendor/qcom/proprietary/biometrics/fingerprint/QFingerprintService/Android.mk",
}

VENDOR_LOCAL_COPY_HEADERS_WHITELIST = {}

VENDOR_DATETIME_WHITELIST = {
    "vendor/qcom/proprietary/qvr-vndr/tools/AnchorTest/Android.mk",
    "vendor/qcom/proprietary/qvr-vndr/tools/qvrdatalogger/Android.mk",
}

VENDOR_TARGET_PRODUCT_WHITELIST = {}

VENDOR_RECURSIVE_WHITELIST = {}

VENDOR_KERNEL_WHITELIST = {}
