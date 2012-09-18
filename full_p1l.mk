# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set build fingerprint / ID / product name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
       PRODUCT_NAME=GT-P1000L \
       TARGET_DEVICE=GT-P1000L \
       BUILD_FINGERPRINT=samsung/GT-P1000L/GT-P1000L:2.3.6/GINGERBREAD/VIJR2:user/release-keys \
       PRIVATE_BUILD_DESC="GT-P1000L-user 2.3.6 GINGERBREAD VIJR2 release-keys"

# --------------------------------------------------------------------------------
# This file is the build configuration for a full Android build.
# --------------------------------------------------------------------------------

# Inherit device configuration.
$(call inherit-product, device/samsung/p1/p1.mk)

# --------------------------------------------------------------------------------
# Discard inherited values and use our own instead.
# --------------------------------------------------------------------------------

PRODUCT_NAME := full_p1l
PRODUCT_DEVICE := p1l
PRODUCT_MODEL := GT-P1000L

# kernel
TARGET_KERNEL_SOURCE := kernel/samsung/p1
TARGET_KERNEL_CONFIG := cyanogenmod_$(PRODUCT_DEVICE)_defconfig

# asserts
TARGET_OTA_ASSERT_DEVICE := galaxytab,$(PRODUCT_MODEL)
