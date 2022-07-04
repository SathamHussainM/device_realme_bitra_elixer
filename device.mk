#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/realme/sm8250-common/common.mk)

# Inherit proprietary libraries
$(call inherit-product, vendor/realme/bitra/bitra-vendor.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Kernel
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/modules/,$(TARGET_COPY_OUT_VENDOR)/lib/modules)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

# RealmeParts
$(call inherit-product, packages/apps/RealmeParts/parts.mk)

PRODUCT_COPY_FILES += \
    packages/apps/RealmeParts/init/cabc.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/cabc.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/realme/bitra
