# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/xdroidsp/xd_manifest -b xd.xii -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/NganuCoeg/local_manifests --depth 1 -b r5x-12 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch xdroid_r5x-eng
export TZ=Asia/Jakarta
make xd

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
