#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# This device was launched with Android N.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n.mk)

# Inherit from mantis device.
$(call inherit-product, device/amazon/mantis/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

PRODUCT_NAME := lineage_mantis
PRODUCT_DEVICE := mantis
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Amzn
PRODUCT_MODEL := Fire TV Stick
