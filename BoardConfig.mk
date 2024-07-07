#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/mantis

# Partitions
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5920046592
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1153433600

# Inherit from mt8695-common
include device/amazon/mt8695-common/BoardConfigCommon.mk

# Inherit the proprietary files
-include vendor/amazon/mantis/BoardConfigVendor.mk
