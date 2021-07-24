# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/StatiXOS/android_manifest.git -b 11 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/JamieHoSzeYui/manifest --depth 1 -b statix .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch statix_cheeseburger-userdebug
export TZ=Asia/Dhaka #put before last build command
export BUILD_BROKEN_OUTSIDE_INCLUDE_DIRS=true
export BUILD_BROKEN_USES_BUILD_COPY_HEADERS=true
m bacon

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
