#Lineage-20 build_script_blossom

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
git clone https://github.com/AsTechpro20/local_manifests_blossom.git -b Lineage-20 .repo/local_manifests
echo "===================================="
echo "Cloning local_manifests was success..."
echo "===================================="

# Initialize Lineage-20 repo
repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs
echo "===================================="
echo "Initializing Lineage-20 repo was success..."
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
export BUILD_USERNAME=Jayzee-Zee
export BUILD_HOSTNAME=crave

# Set up build environment
echo "===================================="
echo "Setting up build environment..."
echo "===================================="
source build/envsetup.sh

#Building Lineage-20
echo "===================================="
echo "Building Lineage-20..."
echo "===================================="
brunch earth-userdebug || brunch earth
