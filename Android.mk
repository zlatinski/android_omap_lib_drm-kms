hardware_modules := libdrm gralloc
include $(call all-named-subdir-makefiles,$(hardware_modules))
