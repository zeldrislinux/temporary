repo init --depth=1 --no-repo-verify -u git://github.com/crdroidandroid/android.git -b 11.0 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/kryptoniteX/local_manifest.git --depth 1 -b crdroid4.19 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=TRUE
export TZ=Asia/Kolkata 
brunch X01BD

rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip.json cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
