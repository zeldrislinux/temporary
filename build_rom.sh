# sync rom
repo init --depth=1 -u git://github.com/lighthouse-os/manifest.git -b raft -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/galanteria01/local_manifest.git --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom again
source build/envsetup.sh
lunch lighthouse_violet-user
export TZ=Asia/Kolkata #put before last build command
export SELINUX_IGNORE_NEVERALLOWS=true
brunch violet

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
rclone copy out/target/product/violet/*violet*json cirrus:violet -P
