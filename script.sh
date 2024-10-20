rm -rf .repo/local_manifests/  && # Clone local_manifests repository
repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
 git clone https://github.com/Dityay/Local-Manifest --depth 1 -b Voltage-14 .repo/local_manifests &&
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Dityay 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
echo Building...
 
# Build the ROM
. build/envsetup.sh
goafterlife earth
