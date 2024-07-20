#ProjectSakura-11 build script

# Remove existing local_manifests
echo "Removing existing local_manifests..."
rm -rf .repo/local_manifests/ 

# Clone local_manifests repository
echo "Cloning local_manifests repository..."
git clone https://github.com/AsTechpro20/local_manifests.git -b ProjectSakura-11 .repo/local_manifests

# Initialize ProjectSakura repo
echo "Initializing ProjectSakura repo..."
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs

# Sync the repositories
echo "Syncing the repositories..."
/opt/crave/resync.sh 

# Set up build environment
echo "Setting up build environment..."
. build/envsetup.sh

# Brunch configuration and Building ProjectSakura
echo "Configuring brunch and building ProjectSakura..."
brunch Mi439

echo "Build completed successfully!"
