# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/PotatoProject/manifest -b dumaloo-release -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/IceBreaker2451/local_manifest --depth 1 -b potato .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# Clang
rm -rf prebuilts/clang/host/linux-x86
git clone https://github.com/4-19-Tulip/android_prebuilts_clang_host_linux-x86_clang-7612306 prebuilts/clang/host/linux-x86

# build rom
source build/envsetup.sh
lunch potato_tulip-userdebug
export TZ=Asia/Kolkata #put before last build command
brunch tulip

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P

