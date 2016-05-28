# Release name
PRODUCT_RELEASE_NAME := Xperia C

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/arima89_we_s_jb2/device_arima89_we_s_jb2.mk)

TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := arima89_we_s_jb2
PRODUCT_NAME := cm_arima89_we_s_jb2
PRODUCT_BRAND := sony
PRODUCT_MODEL := arima89_we_s_jb2
PRODUCT_MANUFACTURER := sony
