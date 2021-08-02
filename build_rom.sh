# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/PotatoProject/manifest -b dumaloo-release -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/sarthakroy2002/local_manifest.git --depth 1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch potato_RMX2020-userdebug
export TZ=Asia/Dhaka #put before last build command
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
brunch RMX2020  

# upload  rom
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
