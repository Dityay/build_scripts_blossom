rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen --git-lfs --depth=1 
 git clone https://github.com/Dityay/Local-Manifest --depth 1 -b Voltage-14 .repo/local_manifests && 
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Dityay 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
echo Repository: Dityay/crave_aosp_builder
 echo Run ID: 11340279996
 
# Build the ROM
breakfast earth userdebug && make installclean && mka bacon -j4
