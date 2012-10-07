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

# Set build fingerprint / ID / product name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
       PRODUCT_NAME=GT-P1000 \
       TARGET_DEVICE=GT-P1000 \
       BUILD_FINGERPRINT=samsung/GT-P1000/GT-P1000:2.3.5/GINGERBREAD/XXJVT:user/release-keys \
       PRIVATE_BUILD_DESC="GT-P1000-user 2.3.5 GINGERBREAD XXJVT release-keys"
