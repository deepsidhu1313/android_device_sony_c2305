# Release name
PRODUCT_RELEASE_NAME := Xperia C

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/c2305/device_c2305.mk)

TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := c2305
PRODUCT_NAME := cm_c2305
PRODUCT_BRAND := sony
PRODUCT_MODEL := c2305
PRODUCT_MANUFACTURER := sony
