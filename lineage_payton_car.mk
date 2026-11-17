#
# SPDX-License-Identifier: Apache-2.0
#

# Android Automotive (AAOS) on the Moto X4, modeled after LineageOS'
# tangorpro_car without the Pixel specific parts (CAN bus, computepipe,
# occupant awareness). The vehicle HAL is the emulated default one.

PORTRAIT_UI := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/lineage/config/common_car.mk)

# Car system, system_ext and product
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false
$(call inherit-product, packages/services/Car/car_product/build/car_generic_system.mk)
$(call inherit-product, packages/services/Car/car_product/build/car_system_ext.mk)
$(call inherit-product, packages/services/Car/car_product/build/car_product.mk)
$(call inherit-product, packages/services/Car/car_product/build/car_vendor.mk)

# Device
$(call inherit-product, device/motorola/payton/device.mk)

# Emulated vehicle HAL and example audio control HAL
$(call inherit-product, device/lineage/car/lineage_car_vendor.mk)

PRODUCT_CHARACTERISTICS := automotive

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/car_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/car_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.type.automotive.xml \
    packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc \
    packages/services/Car/car_product/init/init.car.rc:root/init.car.rc

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := payton
PRODUCT_MANUFACTURER := Motorola
PRODUCT_MODEL := Moto X4
PRODUCT_NAME := lineage_payton_car

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="payton-user 9 PPW29.69-40-4 4ca2a release-keys" \
    BuildFingerprint=motorola/payton/payton:9/PPW29.69-40-4/4ca2a:user/release-keys \
    DeviceProduct=payton
