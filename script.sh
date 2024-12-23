rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/SkylineUI/manifest -b aosp-14 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
 git clone https://github.com/Dityay/android_device_xiaomi_earth_qpr2 device/xiaomi/earth &&
 git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth vendor/xiaomi/earth &&
 git clone https://github.com/Dityay/android_kernel_xiaomi_earth kernel/xiaomi/earth &&
 git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr &&
 git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi &&
 git clone https://github.com/LineageOS/android_hardware_mediatek hardware/mediatek &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Dityay 
 export BUILD_HOSTNAME=crave 
# Set up environment 

# Set up environment
. build/envsetup.sh

# Choose a target
lunch aosp_earth-ap2a-userdebug

# Build the code
mka bacon -j$(nproc --all)
