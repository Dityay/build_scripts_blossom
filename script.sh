#xdroid build_script_blossom

# Remove some stuffs
rm -rf .repo/local_manifests/ 
rm -rf  vendor/xiaomi
rm -rf  kernel/xiaomi
rm -rf  device/xiaomi
rm -rf  device/mediatek
rm -rf  hardware/mediatek
echo "===================================="
echo "Removing stuffs success..."
echo "===================================="

# Clone local_manifests repository
git clone https://github.com/Dityay/Local-Manifest.git -b Voltage-14 .repo/local_manifests
echo "===================================="
echo "Cloning local_manifests was success..."
echo "===================================="

# Initialize xdroid repo
repo init -u https://github.com/xdroid-oss/xd_manifest.git -b fourteen --git-lfs
echo "===================================="
echo "Initializing XDroid repo was success..."
echo "===================================="

# Sync the repositories
/opt/crave/resync.sh || repo sync
echo "===================================="
echo "Syncing the repositories was success..."
echo "===================================="

# Exports
echo "===================================="
echo "Adding exports..."
echo "===================================="
export BUILD_USERNAME=Ditya
export BUILD_HOSTNAME=crave

# Set up build environment
echo "===================================="
echo "Setting up build environment..."
echo "===================================="
source build/envsetup.sh || . build/envsetup.sh

#Building xdroid
echo "===================================="
echo "Building XDroid..."
echo "i hope i dont waste my time to get an error"
echo "===================================="
lunch xdroid_earth-userdebug
make xd -j$(nproc --all)

