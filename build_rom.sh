repo init --depth=1 --no-repo-verify -u https://github.com/Octavi-OS/platform_manifest.git -b 11 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/kryptoniteX/local_manifest.git --depth 1 -b octavius .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

. build/envsetup.sh
lunch octavi_X01BD-userdebug
 #put before last build command
export TZ=Asia/Kolkata
export ALLOW_MISSING_DEPENDENCIES=TRUE
export SKIP_ABI_CHECKS=TRUE
brunch X01BD

rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
