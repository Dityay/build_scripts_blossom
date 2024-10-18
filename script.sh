rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fifteen --git-lfs --depth=1 
 git clone https://github.com/Dityay/Local-Manifest --depth 1 -b Voltage-14 .repo/local_manifests && 
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Dityay 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
echo Building...
 
# Build the ROM
lunch cipher_earth-ap3a-userdebug && mka bacon -j4
