# sync rom
repo init --depth=1 -u git://github.com/CipherOS/android_manifest.git -b eleven -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/HyperNotAryanX97/Begonia -b cipher .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch lineage_begonia-userdebug
mka bacon

# upload rom
rclone copy out/target/product/begonia/CipherOS*.zip cirrus:begonia -P
