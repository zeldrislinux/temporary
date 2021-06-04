# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/Lineage-FE/manifest.git -b lineage-18.1 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/baibhab34/local_manifest --depth 1 -b los .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# patch
cd frameworks/native && curl -O https://github.com/phhusson/platform_frameworks_native/commit/cc94e422c0a8b2680e7f9cfc391b2b03a56da765.patch && patch -p1 < *.patch && cd ../..
cd external/selinux && curl -O https://github.com/phhusson/platform_external_selinux/commit/38d614ec61d610459a7f8e3a243a3dab7a20d356.patch && patch -p1 < *.patch && cd ../..

# build rom
source build/envsetup.sh
lunch lineage_RMX1805-userdebug
mka bacon

# upload rom
rclone copy out/target/product/RMX1805/LineageFE*RMX1805*.zip cirrus:RMX1805 -P
