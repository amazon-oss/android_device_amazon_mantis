#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt8695-common
$(call inherit-product, device/amazon/mt8695-common/mt8695.mk)

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 28

# Inherit the proprietary files
$(call inherit-product-if-exists, vendor/amazon/mantis/mantis-vendor.mk)
