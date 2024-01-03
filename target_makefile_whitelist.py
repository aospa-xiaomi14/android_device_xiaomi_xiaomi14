# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause-Clear

VENDOR_FAILED_FILEPATHS_WHITELIST = {
    # NOTE: these files are from vendor builds
    "vendor/qcom/opensource/audio-kernel/legacy/audio_kernel_modules.mk",
    "vendor/qcom/proprietary/camx/chi-cdk/configs/camera_techpack.mk",
    "vendor/qcom/vsdk_snapshots_config/config.mk",
    "vendor/qcom/proprietary/camx/chi-cdk/configs/product.mk",
    "vendor/qcom/proprietary/prebuilt_grease/target/common/prebuilt.mk",
    "vendor/qcom/proprietary/prebuilt_HY11/target/common/prebuilt.mk",
    "vendor/qcom/proprietary/prebuilt_HY22/target/common/prebuilt.mk",

}

VENDOR_SHELL_WHITELIST = {
    "device/qcom/common/init/Android.mk",
    "device/qcom/common/utils.mk",
    "vendor/qcom/opensource/mmrm-driver/Android.mk",
    "vendor/qcom/opensource/touch-drivers/Android.mk",
    "vendor/qcom/opensource/video-driver/Android.mk",
    "vendor/qcom/opensource/wlan/qcacld-3.0/Android.mk",
    "vendor/qcom/opensource/wlan/utils/sigma-dut/Android.mk",
    "vendor/qcom/proprietary/Innopath/FOTA/MobileUpdateClient/Android.mk",
    "vendor/qcom/proprietary/ac_policy-noship/Android.mk",
    "vendor/qcom/proprietary/common/create_files.mk",
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
    "vendor/qcom/proprietary/wigig/wigig_product.mk",
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

VENDOR_FOREACH_WHITELIST = {
    "device/qcom/common/utils.mk",
    "device/qcom/pineapple/pineapple.mk",
    "device/qcom/wlan/pineapple/BoardConfigWlan.mk",
    "device/qcom/wlan/pineapple/wlan.mk",
    "vendor/qcom/opensource/audio-hal/primary-hal/configs/pineapple/pineapple.mk",
    "vendor/qcom/proprietary/android-perf-noship/profiles.mk",
    "vendor/qcom/proprietary/android-perf/profiles.mk",
    "vendor/qcom/proprietary/android-power-noship/powermodule-vendor-product.mk",
    "vendor/qcom/proprietary/bluetooth/build/bt-vendor-proprietary-product.mk",
    "vendor/qcom/proprietary/perf-core/profiles.mk",
    "vendor/qcom/proprietary/video/ship/video-vendor-modules.mk",
}

VENDOR_MACRO_WHITELIST = {
    "device/qcom/sepolicy_vndr/SEPolicy.mk",
    "hardware/qcom/display/config/display-product.mk",
    "hardware/qcom/media/product.mk",
    "vendor/qcom/opensource/audio-hal/primary-hal/configs/pineapple/pineapple.mk",
    "vendor/qcom/opensource/audio-kernel/audio_kernel_modules.mk",
    "vendor/qcom/opensource/audio-kernel/audio_kernel_product_board.mk",
    "vendor/qcom/opensource/bt-kernel/bt_kernel_vendor_board.mk",
    "vendor/qcom/opensource/camera-kernel/board.mk",
    "vendor/qcom/opensource/commonsys/display/config/display-product-commonsys.mk",
    "vendor/qcom/opensource/data-ipa-cfg-mgr/ipacm_vendor_product.mk",
    "vendor/qcom/opensource/dataipa/dataipa_dlkm_vendor_board.mk",
    "vendor/qcom/opensource/datarmnet-ext/datarmnet_ext_dlkm_vendor_board.mk",
    "vendor/qcom/opensource/datarmnet/datarmnet_dlkm_vendor_board.mk",
    "vendor/qcom/opensource/display-drivers/display_driver_board.mk",
    "vendor/qcom/opensource/dsp-kernel/dsp_kernel_board.mk",
    "vendor/qcom/opensource/eva-kernel/eva_kernel_board.mk",
    "vendor/qcom/opensource/fingerprint/fingerprint_board.mk",
    "vendor/qcom/opensource/fingerprint/fingerprint_product.mk",
    "vendor/qcom/opensource/limits-noship/thermal-stats_board.mk",
    "vendor/qcom/opensource/limits-noship/thermal-stats_product.mk",
    "vendor/qcom/opensource/mm-drivers/mm_driver_board.mk",
    "vendor/qcom/opensource/mmrm-driver/mmrm_kernel_board.mk",
    "vendor/qcom/opensource/spu-kernel/spu_driver_board.mk",
    "vendor/qcom/opensource/synx-kernel/synx_kernel_board.mk",
    "vendor/qcom/opensource/touch-drivers/touch_driver_board.mk",
    "vendor/qcom/opensource/video-driver/video_kernel_board.mk",
    "vendor/qcom/proprietary/android-perf/configs/perf-product-vendor.mk",
    "vendor/qcom/proprietary/android-perf-noship/config/perf-product-vendor-proprietary.mk",
    "vendor/qcom/proprietary/android-perf-noship/profiles.mk",
    "vendor/qcom/proprietary/common/config/device-vendor-SDM845-pureAOSP.mk",
    "vendor/qcom/proprietary/common/config/device-vendor-qssi.mk",
    "vendor/qcom/proprietary/common-noship/etc/device-vendor-noship-SDM845-pureAOSP.mk",
    "vendor/qcom/proprietary/common-noship/etc/device-vendor-noship.mk",
    "vendor/qcom/proprietary/common-noship/etc/device-vendor-qssi-noship.mk",
    "vendor/qcom/proprietary/commonsys/android-perf-noship/config/perf-product-system-proprietary.mk",
    "vendor/qcom/proprietary/commonsys/telephony-build/build/telephony_system_product.mk",
    "vendor/qcom/proprietary/commonsys-intf/data/dpm_system_product_noship.mk",
    "vendor/qcom/proprietary/cne/dpm-ship/dpm_vendor_product_noship.mk",
    "vendor/qcom/proprietary/cv/fastcv/cv_vendor_modules.mk",
    "vendor/qcom/proprietary/data/data_prop_vendor_product.mk",
    "vendor/qcom/proprietary/dspservices_ship/dspservices_vendor_product.mk",
    "vendor/qcom/proprietary/dspservices_ship/remote_debug_agent_vendor_board.mk",
    "vendor/qcom/proprietary/fastmmi/mmi_vendor.mk",
    "vendor/qcom/proprietary/graphics/adreno_buildcfg/build/android/adreno-product.mk",
    "vendor/qcom/proprietary/ims-ship/ims_vendor_product_noship.mk",
    "vendor/qcom/proprietary/kernel-scripts/kernel-platform/kernel-platform-board.mk",
    "vendor/qcom/proprietary/msmirqbalance/msm_irqbalance.mk",
    "vendor/qcom/proprietary/perf-core/configs/perf-core-product-vendor.mk",
    "vendor/qcom/proprietary/qcril-data-hal/datamodule/module/qcril-data-product.mk",
    "vendor/qcom/proprietary/qmi/qmi_data_vendor_product.mk",
    "vendor/qcom/proprietary/securemsm/config/gp_vendor_proprietary_product.mk",
    "vendor/qcom/proprietary/securemsm-internal/securemsm_internal_vendor_product.mk",
    "vendor/qcom/proprietary/spu/config/spu_hal_vendor_proprietary_product.mk",
    "vendor/qcom/proprietary/spu/config/spu_keymint_vendor_proprietary_product.mk",
    "vendor/qcom/proprietary/spu/spdaemon/src/spdaemon-product.mk",
    "vendor/qcom/proprietary/spu-internal/config/sp_hlos_tests_product.mk",
    "vendor/qcom/proprietary/stnfc-firmware/nfc_proprietary_product.mk",
    "vendor/qcom/proprietary/video/binship/media-product.mk",
    "vendor/qcom/proprietary/video/ship/video-vendor-modules.mk",
    "vendor/qcom/proprietary/vpp/config/vpp-vendor-board.mk",

}

VENDOR_OVERRIDE_WHITELIST = {
    #TO-DO: Will append to this list as we encounter and review files
}

VENDOR_SOONG_WHITELIST = {
    "device/qcom/pineapple/BoardConfig.mk",
    "device/qcom/vendor-common/base.mk",
    "hardware/qcom/display/config/display-product.mk",
    "vendor/qcom/opensource/audio-hal/primary-hal/configs/audio_vendor_product.mk",
    "vendor/qcom/opensource/commonsys/display/config/display-product-commonsys.mk",
    "vendor/qcom/opensource/commonsys-intf/display/config/display-product-system.mk",
    "vendor/qcom/proprietary/android-perf/configs/perf-product-vendor.mk",
    "vendor/qcom/proprietary/commonsys-intf/bluetooth/bt-system-proprietary-product.mk",
    "vendor/qcom/proprietary/cv/fastcv/cv_vendor_board.mk",
    "vendor/qcom/proprietary/perf-core/configs/perf-core-product-vendor.mk",
    "vendor/qcom/proprietary/chi-cdk/configs/product.mk",
    "vendor/qcom/proprietary/techpack/artifacts/xr/config/xr-artifacts-product-proprietary.mk",
    "vendor/qcom/proprietary/video/ship/video-vendor-modules.mk",

}
