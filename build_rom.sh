# sync rom
repo init -u https://github.com/PixelExperience/manifest -b eleven -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/MLZ94/local_manifest -b pe .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
 
# build rom
source build/envsetup.sh
lunch aosp_X00QD-userdebug
make bacon

# upload rom
rclone copy out/target/product/X00QD/*2021*.zip cirrus:X00QD -P
