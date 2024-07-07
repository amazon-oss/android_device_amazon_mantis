#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

# Inherit from device makefile.
$(call inherit-product, device/amazon/mantis/device.mk)

# Inherit LineageOS product
$(call inherit-product, vendor/lineage/config/common_mini_tv.mk)

PRODUCT_NAME := lineage_mantis
PRODUCT_DEVICE := mantis
PRODUCT_MANUFACTURER := Amzn
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire TV Stick
