LOCAL_PATH := $(call my-dir)

# kernel binary
#
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/zImage
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

# board specific init.rc
#
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.ti-nspire.rc:root/init.ti-nspire.rc \
	$(LOCAL_PATH)/nspire-keypad.kl:system/usr/keylayout/nspire-keypad.kl
