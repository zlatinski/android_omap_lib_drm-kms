#!/bin/bash
set -e

adb root
adb remount

echo Calling depmode
adb shell depmod

# OMAP DSS modules
echo Loading omapdss
adb shell modprobe -v  omapdss

# Panel Drivers
echo Loading panel drivers
adb shell modprobe -v  panel-generic-dpi
adb shell modprobe -v  panel-n8x0
adb shell modprobe -v  panel-dvi
adb shell modprobe -v  panel-taal
adb shell modprobe -v  panel-picodlp
adb shell modprobe -v  panel-tpo-td043mtea1
adb shell modprobe -v  panel-nec-nl8048hl11-01b
adb shell modprobe -v  panel-sharp-ls037v7dw01
adb shell modprobe -v  panel-lg4591
adb shell modprobe -v  panel-lgphilips-lb035q02
adb shell modprobe -v  panel-tc358765

# Sound Mixer PCM HDMI
echo Loading sound drivers
# adb shell modprobe -v  snd-mixer-oss
# adb shell modprobe -v  snd-pcm-oss

# adb shell modprobe -v  snd-soc-omap-hdmi-codec
# adb shell modprobe -v  snd-soc-omap-hdmi
# adb shell modprobe -v  snd-soc-omap-hdmi-card

# OMAP DRM modules
echo Loading drm module utils
adb shell modprobe -v sysimgblt
adb shell modprobe -v sysfillrect                      
adb shell modprobe -v syscopyarea                                          
adb shell modprobe -v fb_sys_fops
adb shell modprobe -v drm_kms_helper

echo Loading omapdrm
adb shell modprobe -v omapdrm

echo "Current List of modules:"
adb shell lsmod

