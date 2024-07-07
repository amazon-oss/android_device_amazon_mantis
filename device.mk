#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard,tv

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

# Display
PRODUCT_PACKAGES += \
    libdrm \
    libion

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

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

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/mantis/mantis-vendor.mk)

# Inherit the prebuilt kernel files
$(call inherit-product-if-exists, device/amazon/mantis-kernel/kernel.mk)
