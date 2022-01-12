# sync roms
repo init --depth=1 --no-repo-verify -u https://github.com/PotatoProject/manifest -b frico-release -g default,-mips,-darwin,-notdefault
git clone https://github.com/Kneba/local_manifests.git --depth 1 -b master .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build roms
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export PRODUCT_BROKEN_VERIFY_USES_LIBRARIES=true
export RELAX_USES_LIBRARY_CHECK=true
export SELINUX_IGNORE_NEVERALLOWS=true
lunch potato_X00TD-userdebug
export TZ=Asia/Bangkok #put before last build command
brunch X00TD

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
