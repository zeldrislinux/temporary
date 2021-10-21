# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Havoc-OS/android_manifest.git -b eleven -g default,-mips,-darwin,-notdefault
git clone https://github.com/aryankaran/local_manifests.git --depth 1 -b Havoc-OS .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# Build Rom
source build/envsetup.sh
export TZ=Asia/Kolkata
export KBUILD_BUILD_USER=aryan
export KBUILD_BUILD_HOST=aryankaran
export WITH_GAPPS=true
brunch havoc_onclite-user

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
