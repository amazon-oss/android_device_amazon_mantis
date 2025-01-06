#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Inherit dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

## Inherit hwui memory
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

## AAPT
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard,tv

# Charger
WITH_CM_CHARGER := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libaudioutils \
    libaudioroute \
    libtinyalsa

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true

# Display
PRODUCT_PACKAGES += \
    libdrm \
    libion

# Media (OMX)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_SYSTEM)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_tv.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/permissions/,$(TARGET_COPY_OUT_SYSTEM)/etc/permissions)

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt8695 \
    init.mt8695.rc \
    init.mt8695.usb.rc \
    ueventd.mt8695.rc

ifneq ($(filter eng userdebug,$(TARGET_BUILD_VARIANT)),)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0
endif

# Shims
PRODUCT_PACKAGES += \
    libamazonlog \
    libutils_shim

# TV
PRODUCT_PACKAGES += \
    LineageCustomizer

# Wi-Fi
PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    libwpa_client

PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wpa_cli

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi,$(TARGET_COPY_OUT_SYSTEM)/etc/wifi)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/mantis/mantis-vendor.mk)

# Inherit the prebuilt ATV common apps
$(call inherit-product, vendor/google/atv/atv-common.mk)

# Inherit the prebuilt kernel files
$(call inherit-product-if-exists, device/amazon/mantis-kernel/kernel.mk)
