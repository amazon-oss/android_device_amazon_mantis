#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard,tv

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/mantis/mantis-vendor.mk)

# Inherit the prebuilt kernel files
$(call inherit-product-if-exists, device/amazon/mantis-kernel/kernel.mk)
