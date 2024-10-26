rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init --depth=1 -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
repo sync
 git clone https://github.com/Dityay/Local-Manifest --depth 1 -b Voltage-14 .repo/local_manifests &&
 git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Dityay 
 export BUILD_HOSTNAME=crave 
 . build/envsetup.sh && 
echo Building...

# Choose a target device 
lunch cipher_earth-user

# Compile CipherOS 
mka bacon -j$(nproc --all)
