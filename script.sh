rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/SkylineUI/manifest -b aosp-14 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
 git clone https://github.com/Dityay/Local-Manifest --depth 1 -b Voltage-14 .repo/local_manifests &&
 git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr &&
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
