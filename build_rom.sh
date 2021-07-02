# sync rom
repo init --depth=1 -u https://github.com/Corvus-R/android_manifest.git -b 11 -g default,-device,-mips,-darwin,-notdefault

git clone https://github.com/P-Salik/local_manifest --depth=1 -b CorvusOS .repo/local_manifests

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all) || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

#patches
# [1] Boot
cd external/selinux
curl -LO https://github.com/PixelExperience/external_selinux/commit/9d6ebe89430ffe0aeeb156f572b2a810f9dc98cc.patch
patch -p1 < *.patch
cd ../..

# [2] IMS
cd frameworks/opt/net/ims
curl -LO https://github.com/PixelExperience/frameworks_opt_net_ims/commit/661ae9749b5ea7959aa913f2264dc5e170c63a0a.patch
patch -p1 < *.patch
cd ../../../..

# build
. build/envsetup.sh
lunch corvus_RMX1941-userdebug
make corvus -j$(nproc --all)

# upload build
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
