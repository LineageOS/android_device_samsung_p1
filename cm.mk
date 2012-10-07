#
# CyanogenMod product configuration
#

# --------------------------------------------------------------------------------
# Inherit CM stuff
# --------------------------------------------------------------------------------

$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# --------------------------------------------------------------------------------
# Inherit device configuration
# --------------------------------------------------------------------------------

$(call inherit-product, device/samsung/p1/full_p1.mk)

# --------------------------------------------------------------------------------
# override product name - the rest is already defined in full_p1.mk
# --------------------------------------------------------------------------------

PRODUCT_NAME := cm_p1
PRODUCT_DEVICE := p1
PRODUCT_MODEL := GT-P1000

# kernel
TARGET_KERNEL_SOURCE := kernel/samsung/p1
TARGET_KERNEL_CONFIG := cyanogenmod_$(PRODUCT_DEVICE)_defconfig

# asserts
TARGET_OTA_ASSERT_DEVICE := galaxytab,$(PRODUCT_MODEL)

# Set build fingerprint / ID / product name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
       PRODUCT_NAME=GT-P1000 \
       TARGET_DEVICE=GT-P1000 \
       BUILD_FINGERPRINT=samsung/GT-P1000/GT-P1000:2.3.5/GINGERBREAD/XXJVT:user/release-keys \
       PRIVATE_BUILD_DESC="GT-P1000-user 2.3.5 GINGERBREAD XXJVT release-keys"
