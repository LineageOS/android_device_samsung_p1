#
# Copyright (C) 2012 The CyanogenMod Project
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
#

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_P1_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot_p1.img
INSTALLED_P1L_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot_p1l.img
INSTALLED_P1N_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot_p1n.img

INSTALLED_P1_KERNEL_TARGET := $(PRODUCT_OUT)/kernel_p1
INSTALLED_P1L_KERNEL_TARGET := $(PRODUCT_OUT)/kernel_p1l
INSTALLED_P1N_KERNEL_TARGET := $(PRODUCT_OUT)/kernel_p1n

.PHONY: INSTALLED_BOOTIMAGE_COMMON_TARGET

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

TARGET_KERNEL_BINARIES: $(KERNEL_OUT) $(KERNEL_CONFIG) $(KERNEL_HEADERS_INSTALL) $(recovery_uncompressed_ramdisk) $(uncompressed_ramdisk)
	$(MAKE) -C $(KERNEL_SRC) O=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE) $(TARGET_PREBUILT_INT_KERNEL_TYPE)
	$(MAKE) -C $(KERNEL_SRC) O=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE) modules
	$(MAKE) -C $(KERNEL_SRC) O=$(KERNEL_OUT) INSTALL_MOD_PATH=../../$(KERNEL_MODULES_INSTALL) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE) modules_install

INSTALLED_BOOTIMAGE_COMMON_TARGET: $(PRODUCT_OUT)/utilities/flash_image $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/make_ext4fs $(PRODUCT_OUT)/utilities/erase_image
	$(hide) $(ACP) -fp $< $@

$(INSTALLED_P1_BOOTIMAGE_TARGET):
	$(MAKE) $(INSTALLED_KERNEL_TARGET) TARGET_KERNEL_CONFIG=cyanogenmod_p1_defconfig
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1_BOOTIMAGE_TARGET)
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1_KERNEL_TARGET)

$(INSTALLED_P1L_BOOTIMAGE_TARGET):
	$(MAKE) $(INSTALLED_KERNEL_TARGET) TARGET_KERNEL_CONFIG=cyanogenmod_p1l_defconfig
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1L_BOOTIMAGE_TARGET)
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1L_KERNEL_TARGET)

$(INSTALLED_P1N_BOOTIMAGE_TARGET):
	$(MAKE) $(INSTALLED_KERNEL_TARGET) TARGET_KERNEL_CONFIG=cyanogenmod_p1n_defconfig
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1N_BOOTIMAGE_TARGET)
	$(hide) $(ACP) -fp $(INSTALLED_KERNEL_TARGET) $(INSTALLED_P1N_KERNEL_TARGET)

$(INSTALLED_BOOTIMAGE_TARGET): INSTALLED_BOOTIMAGE_COMMON_TARGET
	$(hide) rm -rf $(KERNEL_OUT)
	$(hide) $(MAKE) $(INSTALLED_P1_BOOTIMAGE_TARGET)
	$(hide) rm -rf $(KERNEL_OUT)
	$(hide) $(MAKE) $(INSTALLED_P1L_BOOTIMAGE_TARGET)
	$(hide) rm -rf $(KERNEL_OUT)
	$(hide) $(MAKE) $(INSTALLED_P1N_BOOTIMAGE_TARGET)
	$(hide) $(ACP) -fp $(INSTALLED_P1_BOOTIMAGE_TARGET) $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(ACP) -fp $(INSTALLED_P1_KERNEL_TARGET) $(INSTALLED_KERNEL_TARGET)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET)
	$(ACP) -fp $< $@
